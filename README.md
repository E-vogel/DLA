# Diffusion-Limited Aggregation (DLA)

## Overview
Diffusion-Limited Aggregation (DLA) is a process where particles undergo random motion and cluster together upon contact, forming complex fractal structures. This model is widely used to explain natural patterns seen in various scientific fields.

## Key Concepts
1. **Particle Diffusion**: Particles move randomly and are governed by diffusion.
2. **Aggregation**: When particles contact existing structures, they stick and form clusters.
3. **Fractal Formation**: Over time, particles aggregate to form intricate fractal patterns.

## Simulation Process
1. **Initial Condition**: Start with a seed particle at the center of a grid.
2. **Particle Generation**: Release new particles from the grid boundary.
3. **Random Walk**: Particles perform a random walk.
4. **Attachment**: Particles stick to the structure upon contact.
5. **Iteration**: Repeat the process from 2 to 4.

## Codes

***Increasing the number of lattices n produces finer fractals, but the simulation time increases exponentially.***

### `DLA_2D.m`
The DLA simulation is performed with the dot at the center of figure as the initial particle. Draws a point cloud of attached particles. It is a 2-dimensional plane.

[![Open in MATLAB Online](https://www.mathworks.com/images/responsive/global/open-in-matlab-online.svg)](https://matlab.mathworks.com/open/github/v1?repo=E-vogel/DLA&file=DLA_2D.m)

![DLA_2D](https://github.com/E-vogel/DLA/assets/170056861/6bffdf88-ad09-4f46-8d97-ed3da028dadb)

### `DLA_3D.m`
The DLA simulation is performed with the dot at the center of figure as the initial particle. Draws a point cloud of attached particles. It is a 3-dimensional plane.

[![Open in MATLAB Online](https://www.mathworks.com/images/responsive/global/open-in-matlab-online.svg)](https://matlab.mathworks.com/open/github/v1?repo=E-vogel/DLA&file=DLA_3D.m)

![DLA_3D](https://github.com/E-vogel/DLA/assets/170056861/d5a2f853-7697-44b4-9c87-842f8cef0c7f)

### `DLA_lighting.m`
The DLA simulation is performed with the upper center of the figure as the initial particle.
Draws the attached particles as branched line segments.

[![Open in MATLAB Online](https://www.mathworks.com/images/responsive/global/open-in-matlab-online.svg)](https://matlab.mathworks.com/open/github/v1?repo=E-vogel/DLA&file=DLA_lighting.m)

![DLA_lighting](https://github.com/E-vogel/DLA/assets/170056861/abc516c9-a10d-4591-8800-63733162beb9)
