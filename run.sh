#!/bin/bash

# Move to src folder
cd src

# Remove all existing solutions files in the base directory
cd sonicFoam
foamListTimes -rm
cd ..

Define grid
num_xcells=100
num_ycells=50

# Create all the different angle directories
for angle_vale in 0.091 0.182 0.273 0.364 0.455 0.546
    do 
        foamCloneCase sonicFoam angle_value_$angle_vale
        cd angle_value_$angle_vale
        # Create the mesh
        yangle=$angle_vale num_xcells=$num_xcells num_ycells=$num_ycells blockMesh > log.blockMesh

        # Check if blockMesh was successful
        # if [ $? -ne 0 ]; then
        #     echo "❌ blockMesh failed. Check log.blockMesh for details."
        #     exit 1
        # fi

        # Check mesh quality
        checkMesh -allGeometry -allTopology > log.checkMesh
        echo "✅ Mesh generation completed!"

        # Run the solver
        echo "Running sonicFoam..."
        sonicFoam > log.solver
        # Postprocessing 
        sonicFoam > log.postProcess
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

# Convergence Analysis for Theta=20
# Create all the different angle directories
yangle=0.364

for num_xcells in 10 50 100 200 400 #50 100 200 400
    do 
        foamCloneCase sonicFoam convergence_$num_xcells
        cd convergence_$num_xcells

        # Caluclate num_ycells based on num_xcells
        num_ycells=$(echo "scale=0; $num_xcells * 0.5" | bc)

        # Create the mesh
        yangle=$yangle num_xcells=$num_xcells num_ycells=$num_ycells blockMesh > log.blockMesh

        # Check mesh quality
        checkMesh -allGeometry -allTopology > log.checkMesh
        echo "✅ Mesh generation completed!"

        # Run the solver
        echo "Running sonicFoam..."
        sonicFoam > log.solver
        # Postprocessing 
        sonicFoam > log.postProcess
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
