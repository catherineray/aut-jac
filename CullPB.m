function CullPB(Es, P);

Es0 := [ ];
n := #Es;
D := [-1..1];
CP := CartesianPower(D, n);
for tup in CP do
    E := &+[ tup[i]*Es[i] : i in [1..n] ];
    if Abs(Determinant(E)) eq 1 then
        /* Test Hermitian property */
        Ec := ChangeRing(E, RealField(10));
        Ec := P * ChangeRing(E, BaseRing(P)) * Transpose(P);
        //return Maximum([ Abs(c) : c in Eltseq(Ec) ]);

        /* Test positivity */
        TPc := Matrix([ [ Conjugate(c) : c in Eltseq(r) ] : r in Rows(Transpose(P)) ]);
        Ec := BaseRing(P).1 * P * ChangeRing(E, BaseRing(P)) * TPc;
        res := [ Re(ev[1]) : ev in Eigenvalues(Ec) ];
        if &and([ re gt 0.1 : re in res ]) or &and([ re lt -0.1 : re in res ]) then
            Append(~Es0, E);
        end if;
    end if;
end for;
return Es0;

end function;


function MatricesToIntegers(Es)
Es := [ ChangeRing(E, Integers()) : E in Es ];
Es := [ E : E in Es | &and([ Abs(c) lt 10^6 : c in Eltseq(E)]) ];
return Es;
end function;

