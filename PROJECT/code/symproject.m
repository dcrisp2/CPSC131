%project.m
%Author:    Daniel Crisp

%Clear Workspace & Console
clear; clc;

%% Initialize Variables
%Set Parameters
c = 2.99792458 * 10^8; %Speed of light (m/s)
beta = 0.02; %Fractional Speed w.r.t. 'c'
v = beta*c; %Speed on ions (m/s)

%Ion Species
a = 39; %Mass of Radioactive Potassium
q = 15; %Stripped of 15 electrons, charge-->15+

%Initial Parameters
t0 = 0;
h = 10^-9;
nt = 1000;
L = [8, 4, 8]; %Region Lengths
B = [0 0 0; 0 .2 0; 0 0 0]; %Region Magnetic Field Vectors
X0 = [0 0 0]; %Position, meter
    X1(1,:) = X0;
V0 = [0 0 v]; %Velocity, meters/second
    V1(1,:) = V0;

%Time Variables
Vmag = sqrt(sum(V0.^2)); %Velocity Magnitude
tmax = sum(L)/Vmag; %Time in beamline if Vmag || to Z
%T = t0:h:tmax; %stepped time-space

Xn(2:nt,:) = zeros(nt-1,3);
syms t; %Time, second


%% Region 1: Drift
%   Border Values were given as input
fprintf('\nREGION 1: DRIFT');
[A1, V1, X1 ] = get_equations(q,a,V0,B(1,:),X0);

t1 = eval(solve(X1(3)==L(1),t)); %time in region 1
T1 = t0:h:t1; %time inside R1 (in steps of 'h')
T = T1; %total time inside R1 (in steps of 'h'). So that I can keep T1 for later

nums(1) = length(T1); %number of time steps in R2.
for i=2:nums(1) %Xn(1,:) already defined w/ X0
    Xn(i,:) = eval(subs(X1,t,T(i))); %Maybe should use T1...
end
ezTrace(1,'REGION 1: DRIFT\n',X1,t0,t1);

%R1 stepped positions + times
time = T(1:nums(1));
Xpos = Xn(1:nums(1),1);
Ypos = Xn(1:nums(1),2);
Zpos = Xn(1:nums(1),3);

figure(2);
subplot(2,1,1);
plot(time,Zpos);
    grid on
    title('Distance vs Time');
    xlabel('time (s)');
    ylabel('Z-hat distance (m)');
subplot(2,1,2);
plot(Zpos,Xpos);
    grid on
	title('Transverse vs Longitudinal');
    xlabel('Z-hat distance (m)'); ylabel('X-hat distance (m)');



%% Region 2: Dipole
fprintf('\nREGION 2: DIPOLE\n');
[V0, X0 ] = get_values(X1, V1, t1+h); %First values [1x3] inside R2 from R1 equations
    Xn(nums(1)+1,:) = X0; %To keep all stepped values in sync, and process portion consistant
    X2n(1,:) = X0; %For troubleshooting reference
[A2, V2, X2 ] = get_equations(q,a,V0,B(2,:),X0); %Return R2 Equations
    Xoffset = eval(subs(X2,t,t1+.5*h))-eval(subs(X1,t,t1+.5*h)); %Offset (difference) of X1 and X2 @ border
    X2 = X2-Xoffset; %normalized X at 1-2 border. (i.e. X1@(t1+.5*h)==X2@(t1+.5*h))
t2 = eval(solve(X2(3)==sum(L(1:2)),t)); %total time at end of R2
T2 = t1+h:h:t1+t2; %time inside R2 (in steps of 'h')
T=cat(2,T,T2); %total time inside R1 and R2 (in steps of 'h')

nums(2) = length(T2); %number of time steps in R2. length(T)==sum(nums(1:2))
for i=nums(1)+2:sum(nums(1:2))
    Xn(i,:) = eval(subs(X2,t,T(i)));% Xn(nums(1)+1,:) should = X0
    
    i2 = i-nums(1); %So region specific positions Xn2 are tracked in step w/ global Xn
    Xn2(i,:) = eval(subs(X2,t,T2(i2)));
    
end
ezTrace(3,'REGION 2: DIPOLE',X2,t1,t2);

%ALL stepped positions + times
time = T(:); 
Xpos = Xn(:,1);
Ypos = Xn(:,2);
Zpos = Xn(:,3);

figure(4);
subplot(2,1,1);
plot(time,Zpos);
    grid on
    title('Distance vs Time');
    xlabel('time (s)');
    ylabel('Z-hat distance (m)');
subplot(2,1,2);
plot(Zpos,Xpos);
    grid on
	title('Transverse vs Longitudinal');
    xlabel('Z-hat distance (m)'); ylabel('X-hat distance (m)');


