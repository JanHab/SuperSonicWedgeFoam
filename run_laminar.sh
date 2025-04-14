#!/bin/bash

# Move to src folder
cd src

# Remove all existing solutions files in the base directory
cd sonicFoam
foamListTimes -rm
cd ..

# Define grid
num_xcells=80
num_ycells=180

# Create all the different angle directories
for angle_vale in 0.08715574274765817  0.25881904510252074 0.3420201433256687 0.39073112848927377
    do 
        foamCloneCase sonicFoam laminar_angle_value_$angle_vale
        cd laminar_angle_value_$angle_vale
        # Create the mesh
        yangle=$angle_vale num_xcells=$num_xcells num_ycells=$num_ycells blockMesh > log.blockMesh

        # Check mesh quality
        checkMesh -allGeometry -allTopology > log.checkMesh
        echo "✅ Mesh generation completed!"

        # Run the solver
        echo "Running sonicFoam..."
        sonicFoam > log.solver
        # Postprocessing 
        sonicFoam -postProcess > log.postProcess
        if [ $? -ne 0 ]; then
            echo "❌ sonicFoam failed. Check log.solver for details."
            exit 1
        fi
        echo "✅ Solver completed!"

        # Create touch.case for paraview
        touch case.foam

        # Move back to the base directory
        cd ..
    done