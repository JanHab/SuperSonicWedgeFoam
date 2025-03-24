# CFD
CFD Project

## Settings

Solver: `sonicFoam`

Remove solver files: `foamListTimes -rm`

## Tricky

Be careful with the "time-steps"
It is transient and the Courant number has to be small

$$
C = a \Delta t / \Delta x
$$