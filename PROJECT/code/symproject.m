%project.m
%Author:    Daniel Crisp

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
h = 10^-9;
nt = 1000;
L = [8, 4, 8]; %Region Lengths
B = [0 0 0; 0 .2 0; 0 0 0]; %Region Magnetic Field Vectors
Xn = [0 0 0]; %Position, meter
Vn = [0 0 v]; %Velocity, meters/second

%Time Variables
Vmag = sqrt(sum(Vn.^2)); %Velocity Magnitude
tmax = sum(L)/Vmag; %Time in beamline if Vmag || to Z
%T = t0:h:tmax; %stepped time-space
Xn(2:nt,:) = zeros(nt-1,3);
syms t; %Time, second

%Region 1: Drift
%   Border Values were given as input
fprintf('\nREGION 1: DRIFT');
[A, V, X ] = get_equations(q,a,Vn,B(1,:),Xn(1,:));

t1 = eval(solve(X(3)==L(1),t)); %time in region 1
T = t0:h:t1;

numR1 = length(T);
i = 2;
for i=2:numR1
    Xn(i,:) = eval(subs(X,t,T(i)));
end
ezTrace(1,'REGION 1: DRIFT\n',X,t0,t1);

time = T(1:numR1);
Zpos = Xn(1:numR1,3);
Ypos = Xn(1:numR1,2);
Xpos = Xn(1:numR1,1);

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



%Region 2: Dipole
fprintf('\nREGION 2: DIPOLE\n');
[Vb, Xb ] = get_values(X, V, t1);
[A, V, X ] = get_equations(q,a,Vb,B(2,:),Xb);

t2 = eval(solve(X(3)==sum(L(1:2)),t)); %time in region 2
Tnew = t1+h:h:t1+t2;
T=cat(2,T,Tnew);

numR2 = length(Tnew);
for i=numR1+1:numR1+numR2
    Xn(i,:) = eval(subs(X,t,T(i)));
end
ezTrace(3,'REGION 2: DIPOLE',X,t1,t2);

time = T(:);
Zpos = Xn(:,3);
Ypos = Xn(:,2);
Xpos = Xn(:,1);

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


