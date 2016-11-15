function [dX] = CartDynamics(X)
% [dx]=CartDynamics
%x(1)=x
%x(2)= q;
%x(3)=dx;
%x=(4)=dq
x=X(1)
q=X(2);  
dx=X(3);
dq= X(4);
m =[3,2*cos(q);cos(q),1]
b=[2*dq*dq*sin(q);-9.8*sin(q)]
ddx=inv(m)*b
dX=[dx;dq;ddx]
end

