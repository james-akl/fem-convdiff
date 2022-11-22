# Finite Element Analysis of 1D Convection–Diffusion

This project explores the **formulation**, **implementation**, and **optimization** of a **Finite Element Method** for a **1D Convection–Diffusion** PDE.

[**Project Page**](https://jamesakl.com/fem-convdiff) | [**PDF Report**](https://jamesakl.com/fem-convdiff.pdf)

A weak-form **Galerkin formulation** is used for the finite element analysis of this PDE. In the numerical implementation, the total number of elements *N* is inputted by the user. The mesh size is deduced from the number *N* of elements. The interpolation order is quadratic. Numerical integration is performed using the **Gauss–Legendre Quadrature** method. A **sparse matrix structure** is implemented. The assembly procedure is carried out using an optimized connectivity matrix. The system is solved with a direct sparse linear solver. A **convergence analysis** with respect to the mesh size is performed. The same model is built using *COMSOL*, while the exact solution is obtained using *Mathematica*. The three solutions are compared.

The project page details the methodology, mathematical formulation, simulation, results, and discussion.

The project scripts have been implemented in MATLAB and are mostly compatible with open-source MATLAB cognates such as [GNU Octave](https://www.gnu.org/software/octave/).
