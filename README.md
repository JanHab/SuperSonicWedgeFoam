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