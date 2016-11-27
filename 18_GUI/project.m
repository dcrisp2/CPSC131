%project.m
%Author:    Daniel Crisp

%Set Parameters
c = 2.99792458 * 10^8; %Speed of light (m/s)
beta = 0.02; %Speed of Ions (m/s)
v = beta*c;

E = 12*10^3; %12KeV
p_si = 5.344286*10^-28; %eV/c to kg*m/s

X = [0 0 0];
V = [0 0 beta];