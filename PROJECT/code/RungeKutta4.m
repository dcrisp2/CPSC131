function [X,t] = RungeKutta4(X,dX,t,h)
    %Approximate the next position Xnew at time = t + h with RK4 method.
    %A weighted sum of the derivative evaluated at four partial steps (<h) is
    %then added to the initial position X.
    
    %Specify values
    X0 = X; %initial position
    t0 = t; %initial time
    t = t0 + h; %final time
    a = 0.5;
    
    %for n = 0, 1, 2, 3,... define 'increment constants'
    k1 = subs( subs(dX,t,t0), X,X0);
    k2 = subs( subs(dX,t,t0+a*h), X,X0+a*h*k1);
    k3 = subs( subs(dX,t,t0+a*h), X,X0+a*h*k2);
    k4 = subs( subs(dX,t,t0+h), X,X0+h*k3);
    
    %Define New Position
    X = X0 + h/6*(k1 + 2*k2 + 2*k3 + k4); %i.e. X@(t+h)
end