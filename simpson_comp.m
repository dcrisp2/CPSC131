function [Y1] = simpson_comp38(Y, x0, h)
    syms x;
    
    A = h*(1/3);
    x1 = x0;
    x2 = x0+0.5*h;
    x3 = x0+h;
    
    k1 = Y(x1);
    k2 = Y(x2);
    k3 = Y(x3);
    
    Y1 = A*(k1 + 2*k2 + k3);
end
