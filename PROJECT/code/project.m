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
nt = 1000;
L = [8, 4, 8]; %Region Lengths
B = [0 0 0; 0 .2 0; 0 0 0]; %Region Magnetic Field Vectors
X = [0 0 0]; %Position, meter
V = [0 0 v]; %Velocity, meters/second

%Process Variables
Vmag = sqrt(sum(V.^2)); %Velocity Magnitude
tmax = sum(L)/Vmag; %Time in beamline if Vmag || to Z
T = linspace(t0,tmax,nt); %stepped time-space
syms t; %Time, second

%Region 1: Drift
%   Border Values were given as input
[A, V, X ] = set_equations(q,a,V,B(1,:),X);
[An, Vn, Xn] = eval_equations(A, V, X);
t1 = eval(solve(X(3)==L(1),t)); %time in region 1
ezTrace(1,'REGION 1: DRIFT',X,t0,t1);


%Region 2: Dipole
[Vb, Xb ] = get_border_values(X, V, t1);
[A, V, X ] = set_equations(q,a,Vb,B(2,:),Xb);

t2 = eval(solve(X(3)==L(2),t)); %time in region 2
ezTrace(2,'REGION 2: DIPOLE',X,t1,t2);



