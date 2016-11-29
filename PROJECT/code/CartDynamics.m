function [dX] = CartDynamics(X)
% [dx]=CartDynamics
%x(1)=x
%x(2)= q;
%x(3)=dx;
%x=(4)=dq
x = X(1)
y = X(2);  
dx = X(3);
dy = X(4);
dz = X(5);
m =[3,2*cos(y);cos(y),1]
b=[2*dy*dy*sin(y);-9.8*sin(y)]
ddx=inv(m)*b
dX=[dx;dy;ddx]
end

