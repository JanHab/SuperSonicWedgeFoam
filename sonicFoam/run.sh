#!/bin/bash

# Remove all existing solutions files in the current directory
foamListTimes -rm

# Define input parameters
yangle=0.091
num_xcells=100
num_ycells=50

# Run OpenFOAM's blockMesh with parameters
yangle=$yangle num_xcells=$num_xcells num_ycells=$num_ycells blockMesh > log.blockMesh

# Check if blockMesh was successful
if [ $? -ne 0 ]; then
    echo "❌ blockMesh failed. Check log.blockMesh for details."
    exit 1
fi

# Check mesh quality
checkMesh -allGeometry -allTopology > log.checkMesh

echo "✅ Mesh generation completed!"

# todo: Add parallel solver
# Run the solver
echo "Running sonicFoam..."
sonicFoam > log.solver
if [ $? -ne 0 ]; then
    echo "❌ sonicFoam failed. Check log.solver for details."
    exit 1
fi
echo "✅ Solver completed!"

# cp -r 0_empty 0
# #cp -r 0_slip 0

# renumberMesh -overwrite | tee log.renumbermesh
# rhoPimpleFoam | tee log.solver

# rhoPimpleFoam -postProcess -func MachNo
# rhoPimpleFoam -postProcess -func CourantNo
# rhoPimpleFoam -postProcess -func wallShearStress
# rhoPimpleFoam -postProcess -func 'writeObjects(rho)' -time 0
# rhoPimpleFoam -postProcess -func 'writeObjects(K)' -time 0
# rhoPimpleFoam -postProcess -func vorticity
# #postProcess -func vorticity
