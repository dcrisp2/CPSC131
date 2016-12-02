function [A, V, X] = get_equations(q,a,V0,B,X0)
    syms t;
    A = (q/a)*cross(V0,B); %should change direction as V does
    V = int(A,t)+V0; %as direction changes, force will allways be along turn radii
    %X = int( int((q/a)*cross(V0,B),t) +V0,t) +X0
    X = int(V,t)+X0;
end