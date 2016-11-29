function [X1,t1] = Simpson(X,dX,t0,h)
    %Approximate the next position Xnew at time = t + h with RK4 method.
    %A weighted sum of the derivative evaluated at four partial steps (<h) is
    %then added to the initial position X.
    
    %Specify values
    X0 = eval(subs(X,t,t0)); %initial position
    t0 = t; %initial time
    t1 = t0 + h; %final time
    a = 0.5;
    
    %for n = 0, 1, 2, 3,... define 'increment constants'
    k1 = subs(dX,t,t0);
    k2 = subs(dX,t,t0+a*h);
    k3 = subs(dX,t,t);
    
    %Define New Position
    X1 = X0 + h/6*(k1 + 4*k2 + k3); %i.e. X@(t+h)
end