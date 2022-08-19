# Simulating the motion of three point vortices in a plane

In analogy to the point mass or point charge, point vortices can be defined as zero-dimensional objects characterized by a circulation. These point vortices represent interesting objects of study both purely mathematically (e.g., Aref, 2007 and Müller, 2018) and meteorologically (e.g., Müller et al., 2015 and Müller, 2018). Their time evolution can be described with the Helmholtz equations, which are directly based on Euler's equations of motion, and find application in the scope of Kelvin's circulation theorem. Point vortices can be used to describe atmospheric blocking situations (with three vortices) or to estimate the stability of the polar vortex (with nine vortices), for details see Müller et al., 2015. <br>
This repository provides functions to calculate the Helmholtz equations for three point vortices in a plane, to integrate them forward in time and to vizualise them. 

## Code Description
`calc_evolution.r`: script containing functions for Helmholtz equations and time evolution <br>

**Examples:**<br>
`./examples/run_examples.r`: contains input data and visualization for some examples <br><br>

Example 1: periodic motion<br>
Example 2: periodic motion on circles<br>
Example 3: expansion<br><br>


Contact: laura.mack@fu-berlin.de

