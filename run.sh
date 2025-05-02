#!/bin/bash

# Move to src folder
cd src

# Define grid
num_xcells=200
num_ycells=300

##########################################################################################
##########################################################################################
##########################################################################################
##########################################################################################
# M=1.5
# Move to base directory ad remove old cases
cd M1.5_base
foamListTimes -rm
cd ..
for angle_vale in 0.00000000000 0.08715574274765817 0.17364817766693033
# for angle_vale in 0.08715574274765817 0.17364817766693033
    do 
        foamCloneCase M1.5_base M1.5_$angle_vale
        cd M1.5_$angle_vale
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

        # Move to results folder
        mv -f M1.5_$angle_vale ../results/M1.5_$angle_vale
    done

##########################################################################################
##########################################################################################
##########################################################################################
##########################################################################################
# M=2.0
# Move to base directory ad remove old cases
cd M2.0_base
foamListTimes -rm
cd ..
for angle_vale in 0.00000000000 0.08715574274765817 0.17364817766693033 0.25881904510252074 0.3420201433256687 0.39073112848927377 0.42261826174069944 0.49999999999999994
    do 
        foamCloneCase M2.0_base M2.0_$angle_vale
        cd M2.0_$angle_vale
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

        # Move to results folder
        mv -f M2.0_$angle_vale ../results/M2.0_$angle_vale
    done

##########################################################################################
##########################################################################################
##########################################################################################
##########################################################################################
# M=2.5
# Move to base directory ad remove old cases
cd M2.5_base
foamListTimes -rm
cd ..
for angle_vale in 0.00000000000 0.08715574274765817 0.17364817766693033 0.25881904510252074 0.3420201433256687 0.39073112848927377 0.42261826174069944 0.49999999999999994
    do 
        foamCloneCase M2.5_base M2.5_$angle_vale
        cd M2.5_$angle_vale
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

        # Move to results folder
        mv -f M2.5_$angle_vale ../results/M2.5_$angle_vale
    done
