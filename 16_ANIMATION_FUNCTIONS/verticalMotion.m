function verticalMotion(x0,y0,z0,vx0,vy0,vz0,m)
    %Clear console
    clc;
    
    %Initial Variables
    g = 9.81;               %Acceleration of gravity (9.81 m/s^2)    
    X0 = [x0;y0;z0];        %Initial Position
    V0 = [vx0;vy0;vz0];     %Initial Velocity
    a = [0;-g;0];           %Acceleration (only considering gravity)
    
    %Time
    tmax = 4; %seconds
    Nt = 500; %time steps
    time = linspace(0,tmax,Nt);
    syms t; %for easier integration

    %Force (F=ma)
    F = m*a;  %Only considering gravity so far...
    
    %Velocity
    V = V0 + int(F,t);  %Velocity Vector
    S = sqrt(sum(V.^2));  %Speed
    
    %Position
    X = X0 + int(V,t);
    
    %Energy
    E(1) = sqrt(sum((F.*X).^2));  %Potential Energy
    E(2) = 1/(2*m*S^2);  %Kinetic Energy
    TE = sum(E);  %Total Energy

    %fprintf('\nVertical Position: %d meters',X(2));
    %fprintf('\nVertical Velocity: %d meters/second',V(2));
    %fprintf('\nPotential Energy: %d joules',E(1));
    %fprintf('\nKinetic Energy: %d joules',E(1));
    %fprintf('\nTotal Energy: %d joules',TE);
    
    subplot
    
end