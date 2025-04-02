#!/bin/bash

# Move to src folder
cd src

# Remove all existing solutions files in the base directory
cd sonicFoam
foamListTimes -rm
cd ..

for angle_vale in 0.091 0.182 0.273 0.364 0.455 0.546
    do 
        rm -rf sonicFoam/angle_value_$angle_vale
    done

for num_xcells in 10 50 100 200 400 #50 100 200 400
    do 
        rm -rf sonicFoam/convergence_$num_xcells
    done