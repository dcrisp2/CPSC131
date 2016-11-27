% vectorField.m
%   Author: Daniel Crisp
%Clear, Clean
clear; clc;
script = 'vectorField.m';

%Set Parameters
B = [0, 0, -.3]; %B-Field into the page (-Zhat)
Bmag = sqrt(sum(B.^2));

%Define grid
Nx = 10;
x = 0:1:Nx;
y=x-(0.5*Nx); %Shift center of range from x to 0.
%[X, Y, Z] = meshgrid(x,y,y);
[X, Y] = meshgrid(x,y);

%Compute Vector Field
Rx = X; Ry = Y;
Rmag=sqrt(Rx.*Rx+Ry.*Ry); %distance from origin
V=Rmag.*Ry
Fmag = Vmag*Bmag; %Assuming angle = 90;

%Plot Vector Field
quiver(Vx, Vy, Fx, Fy, 'r');
title('Force = V(x,y,z) x B(x,y,z)')
xlabel('X, Velocity (m/s)')
ylabel('Y, Velocity (m/s)')