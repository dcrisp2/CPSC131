% DemoQuiver.m
%   Author: Heino Vanderjuice
%% set parameters
Nx=30;
a=1.5;
lambda=5;
%% define grid
x=linspace(-4,4,Nx);
[X, Y]=meshgrid(x,x);
%% Compute Vector Field
Rmag=sqrt(X.*X+Y.*Y);
ThetaHatx=-Y./Rmag;
ThetaHaty=X./Rmag;
Vmag=sin(2*pi*Rmag/lambda).*Rmag.*exp(-Rmag/a);
Vx=Vmag.*ThetaHatx;
Vy=Vmag.*ThetaHaty;
%% Plot Vector Field
quiver(X, Y, Vx, Vy, 'k');
axis square
title('quiver(X, Y, Vx, Vy)')
xlabel('x(cm)')
ylabel('y(cm)')