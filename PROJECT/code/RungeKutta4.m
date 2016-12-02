function [X1,t1] = RungeKutta4(X,dX,t0,h)
    %Approximate the next position Xnew at time = t + h with RK4 method.
    %A weighted sum of the derivative evaluated at four partial steps (<h) is
    %then added to the initial position X.
    syms t;
    
    %Specify values
    X0 = eval(subs(X,t,t0)); %initial position, even if t was not in it
    t1 = t0 + h; %final time
    a = 0.5;
    ta = t0+a*h;
    
    %for n = 0, 1, 2, 3,... define 'increment constants'
    %   NOTE: May have found a hint at a better way of entry (returning
    %   more readable values too
    %       syms var1 var2
    %       f = (3060513257434037*var1^2)/1125899906842624 + var1 + ...
    %       (3060513257434037*var2^2)/1125899906842624 + var2 + ...
    %       4186413164276661/1125899906842624;
    k1 = eval(subs(dX,t,t0)*t0 + X0);
    k2 = eval(subs(dX,t,ta)*ta + X0+a*h*k1);
    k3 = eval(subs(dX,t,ta)*ta + X0+a*h*k2);
    k4 = eval(subs(dX,t,t1)*t1 + X0+a*h*k3);
    
    %Define New Position
    X1 = X0 + h/6*(k1 + 2*k2 + 2*k3 + k4); %i.e. X@(t+h)
end