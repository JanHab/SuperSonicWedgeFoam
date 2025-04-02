#!/bin/bash

# Remove all existing solutions files in the base directory
cd sonicFoam
foamListTimes -rm
cd ..

# Define grid
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

# # Define input parameters
# # yangle=0.091
# # num_xcells=100
# # num_ycells=50
# # Read command-line arguments
# yangle=$1
# num_xcells=$2
# num_ycells=$3

# # Run OpenFOAM's blockMesh with parameters
# yangle=$yangle num_xcells=$num_xcells num_ycells=$num_ycells blockMesh > log.blockMesh

# # Check if blockMesh was successful
# if [ $? -ne 0 ]; then
#     echo "❌ blockMesh failed. Check log.blockMesh for details."
#     exit 1
# fi

# # Check mesh quality
# checkMesh -allGeometry -allTopology > log.checkMesh

# echo "✅ Mesh generation completed!"

# # todo: Add parallel solver
# # Run the solver
# echo "Running sonicFoam..."
# sonicFoam > log.solver
# if [ $? -ne 0 ]; then
#     echo "❌ sonicFoam failed. Check log.solver for details."
#     exit 1
# fi
# echo "✅ Solver completed!"

# # cp -r 0_empty 0
# # #cp -r 0_slip 0

# # renumberMesh -overwrite | tee log.renumbermesh
# # rhoPimpleFoam | tee log.solver

# # rhoPimpleFoam -postProcess -func MachNo
# # rhoPimpleFoam -postProcess -func CourantNo
# # rhoPimpleFoam -postProcess -func wallShearStress
# # rhoPimpleFoam -postProcess -func 'writeObjects(rho)' -time 0
# # rhoPimpleFoam -postProcess -func 'writeObjects(K)' -time 0
# # rhoPimpleFoam -postProcess -func vorticity
# # #postProcess -func vorticity
