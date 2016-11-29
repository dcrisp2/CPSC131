function [V, X] = get_border_values(X, V, t1)
    %Position and Velocity vectors at t1
    syms t;
    X = eval(subs(X,t,t1));
    V = eval(subs(V,t,t1));
end