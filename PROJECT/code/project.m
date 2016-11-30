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
h = 10^-8;
nt = 1000;
L = [8, 4, 8]; %Region Lengths
B = [0 0 0; 0 .2 0; 0 0 0]; %Region Magnetic Field Vectors
Xn = [0 0 0]; %Position, meter
Vn = [0 0 v]; %Velocity, meters/second

%Time Variables
Vmag = sqrt(sum(Vn.^2)); %Velocity Magnitude
tmax = sum(L)/Vmag; %Time in beamline if Vmag || to Z
T = linspace(t0,tmax,nt); %stepped time-space
syms t; %Time, second

%Region 1: Drift
%   Border Values were given as input
fprintf('\nREGION 1: DRIFT');
[A, V, X ] = get_equations(q,a,Vn,B(1,:),Xn);
[Vn, Xn, tn] = eval_equations(q,a, Vn, B(1,:),Xn, L(1), t0, h);

t1 = eval(solve(X(3)==L(1),t)); %time in region 1
ezTrace(1,'REGION 1: DRIFT',X,t0,t1);
simplePlot( 2, text, Xn, tn);

%Region 2: Dipole
fprintf('\nREGION 2: DIPOLE');
[Vb, Xb ] = get_values(X, V, t1);
[A, V, X ] = get_equations(q,a,Vb,B(2,:),Xb);
[Vn, Xn, tn] = eval_equations(q,a, Vn, B(2,:),Xn, sum(L(1:2)), tn, h);

t2 = eval(solve(X(3)==L(2),t)); %time in region 2
ezTrace(3,'REGION 2: DIPOLE',X,t1,t2);
simplePlot( 4, text, Xn, tn);



