%project.m
%Author:    Daniel Crisp
%
%NOTES
%E = 12*10^3; %12KeV
%p_si = 5.344286*10^-28; %eV/c to kg*m/s
%

%Clear Workspace & Console
clear; clc;

%Set Parameters
c = 2.99792458 * 10^8; %Speed of light (m/s)
beta = 0.02; %Fractional Speed w.r.t. 'c'
v = beta*c; %Speed on ions (m/s)

%Ion Species
a = 39; %Mass of Radioactive Potassium
q = 15; %Stripped of 15 electrons, charge-->15+

%Initial Parameters
t0 = 0;
X = [0 0]; %X-Y Position, meter
s = 0; %axial position, meter
B = [0 0 0]; %Field, tesla
B_dipole = [0 0.2 0];
V = [0 0 v]; %Velocity, meters/second
syms t; %Time, second

%Region 1: Drift
%   B = [0 0 0]
L(1) = 8;
[A, V, X ] = set_equations(q,a,V,B,X);
t1 = eval(solve(X(3)==sum(L),t)); %time in region 1

ezTrace(1,'REGION 1: DRIFT',X,t0,t1);


%Region 2: Dipole
L(2) = 4;
[Vb, Xb ] = get_border_values(X, V, t1);
B = B_dipole;
[A, V, X ] = set_equations(q,a,Vb,B,Xb);
t2 = eval(solve(X(3)==sum(L),t)); %time in region 2

ezTrace(2,'REGION 2: DIPOLE',X,0,t2);
