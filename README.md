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

## Similar Paper

- [CFD Analysis for supersonic flow  over a wedge](https://ijariie.com/AdminUploadPdf/CFD_ANALYSIS_FOR_SUPERSONIC_FLOW_OVER_A_WEDGE_ijariie5053.pdf)
- [Optimization of Two-dimensional WedgeFlow Fieldat Supersonic Mach Number](https://www.akademiabaru.com/submit/index.php/cfdl/article/view/3165/2198)
- [COMPUTATIONAL ANALYSIS OF SUPERSONIC FLOW AROUND A WEDGE AND A CYLINDER USING BUILDING-CUBE METHOD](https://www.icas.org/icas_archive/ICAS2022/data/papers/ICAS2022_0416_paper.pdf)
- [Supersonic Flow Over a Wedge and a Cone](https://innovationspace.ansys.com/courses/wp-content/uploads/sites/5/2020/12/Wedge-vs-Cone.pdf)
- [Supersonic Flow onto Solid Wedges, Multidimensional Shock Waves and Free Boundary Problems](https://arxiv.org/abs/1703.03997)
- [Presentation: Supersonic flow past a wedge](https://www.wolfdynamics.com/wiki/tut_2D_supersonic_wedge.pdf)
- [Tutorial: Supersonic flow past a wedge](https://www.wolfdynamics.com/tutorials.html?id=130)

## Git CheatSheet

To add file/changes of file to git. Replace file with a dot (.) to add all changes

```bash
git add file
```

To commit the changes with a meaningful commit message (in one sentence/short phrase what have you changed)

```bash
git commit -m "commit message"
```

And finally, push the changes to the remote git (the online version)

```bash
git push
```