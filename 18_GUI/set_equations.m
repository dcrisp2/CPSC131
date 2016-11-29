function [A, V, X] = set_equations(q,a,V0,B0,X0)
    syms t;
    A = (q/a)*cross(V0,B0);
    V = int(A,t)+V0;
    X = int(V,t)+X0;
end