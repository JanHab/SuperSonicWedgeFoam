#!/bin/bash

# Move to src folder
cd src

# Remove all existing solutions files in the base directory
cd sonicFoam
foamListTimes -rm
cd ..

# Define grid
num_xcells=80
num_ycells=130

# Create all the different angle directories
# for angle_vale in 0.000 0.091 0.182 0.273 0.364 0.419 0.455 0.546
for angle_vale in 0.00000000000 0.08715574274765817 0.17364817766693033 0.25881904510252074 0.3420201433256687 0.39073112848927377 0.42261826174069944 0.49999999999999994
    do 
        foamCloneCase turbulenceTrial turbulence_angle_value_$angle_vale
        cd turbulence_angle_value_$angle_vale
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

# # Convergence Analysis for Theta=20
# # Create all the different angle directories
# yangle=0.273 #0.364 # 0.182

# # for num_xcells in 50 100 200
# # Define corresponding arrays so values are paired by index
# xcell_values=(50 100 200)
# ycell_values=(82 163 325)

# # Loop through the indices
# for i in {0..2}
# do
#     num_xcells=${xcell_values[$i]}
#     num_ycells=${ycell_values[$i]}
    
#     foamCloneCase turbulenceTrial turbulence_convergence_${num_xcells}_${num_ycells}
#     cd turbulence_convergence_${num_xcells}_${num_ycells}

#     # Create the mesh
#     yangle=$yangle num_xcells=$num_xcells num_ycells=$num_ycells blockMesh > log.blockMesh

#     # Check mesh quality
#     checkMesh -allGeometry -allTopology > log.checkMesh
#     echo "✅ Mesh generation completed!"

#     # Run the solver
#     echo "Running sonicFoam..."
#     sonicFoam > log.solver
    # sonicFoam -postProcess > log.postProcess
    
#     if [ $? -ne 0 ]; then
#         echo "❌ sonicFoam failed. Check log.solver for details."
#         exit 1
#     fi
#     echo "✅ Solver completed!"

#     # Create touch.case for paraview
#     touch case.foam

#     # Move back to the base directory
#     cd ..
# done

