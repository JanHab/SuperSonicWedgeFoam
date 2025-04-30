#!/bin/bash

# Remove all existing solutions files in the base directories
cd src/M1.5_base
foamListTimes -rm
cd ../M2.0_base
foamListTimes -rm
cd ../M2.5_base
foamListTimes -rm
cd ../..

rm -rf results
mkdir results
rm -rf Figures
mkdir Figures