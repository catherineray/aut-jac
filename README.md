# aut-jac
Code and instructions related to the paper Automorphisms of the Jacobian, co-authored with Dami Lee.

The necessary packages to run the full program are as follows. Getting the underlying automorphism set of Hom(C_1, C_2) requires SageTrac, Magma, and Costa's endomorphism group package; the group identification uses the `GAP` SmallGroup package. A very useful collection of documentation at the time of writing may be found in the sagemath github, in the file `schemes/riemann_surfaces/riemann_surface.py`.

The code in this folder was written almost entirely by Jeroen Sijsling in private correspondence. The implementation is particularly nice for hyperelliptic curves. 

```
f = hyperelliptic curve
S = RiemannSurface(f, prec = 100)
G = S.symplectic_automorphism_group()
print G.order()
```

For non-hyperellptic curves, we must trick the package for now, by sticking in a "dummy" hyperelliptic curve of the same genus. 

Here the code for `autperio.sage` relies on `CullPB.m`. The psuedo-code is in section ~\ref{sec:autperio} and ~\ref{sec:find} respectively. 

Sijsling's `FindPolarizationBasis` Magma function plays nicely with the full period matrix `big`, and not the pre-symmetrized one `small`. Though one can always create `big` out of `small` by appending an identity matrix of the same shape to the small matrix.
