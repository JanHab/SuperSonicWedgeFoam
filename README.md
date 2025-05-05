# SupersonicWedge

Reproducability repository for the course project "Investigate supersonic flow over a wedge with varying angle of attack".

The [OpenFoam](https://www.openfoam.com/) CFD software can be used to reproduce all the results. For this work, version 2406 was used.

## Physical Background

- Supersonic flow around a wedge creates shocks (discontinuities) around the geometry
- The shocks increase for increasing inflow velocities and wedge angles
- Compressible Navier-Stokes-Fourier equations are solved
- Pressure-based `sonicFoam` solver

## Main Features

- Automatic grid generation for different angles of wedge
- Intuitive implementation in OpenFOAM
- Easy to use analysis with python (calling ParaView API)
  - Cutplots
  - Lineplots
  - Comparison to analytical results
  - Residuals
- Script to run different geometries
- Analysis with analytical findings

## Tutorial

There are two options, either running the `run.sh` script to run each simulation or generating your own simulation with your own mesh and wedge angle.

For the `run.sh` simply run:

```bash
./run.sh
```

maybe you need to give certain rights to the script with:

```bash
chmod +x run.sh
```

Alternatively define your wedge angle (in this tutorial 20°) and grid settings (number of elements in x and y direction) by yourself and use one of the base cases in `src`.

```bash
num_xcells=200
num_ycells=300
yangle=0.3420201433256687
```

Create and check the mesh.

```bash
yangle=$angle_vale num_xcells=$num_xcells num_ycells=$num_ycells blockMesh > log.blockMesh
checkMesh -allGeometry -allTopology > log.checkMesh
```

Run `sonicFoam` solver and postprocess for density and create touch.case file for ParaView.

```bash
sonicFoam > log.solver
sonicFoam -postProcess > log.postProcess
touch case.foam
```

## Contact

- Jan Habscheid
- Adrian Elias Haugjord
- Daniel Eric Offer
