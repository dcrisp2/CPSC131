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
    t = linspace(0,tmax,Nt);
    syms time; %for easier integration

    %Force (F=ma)
    F = m*a;  %Only considering gravity so far...
    
    %Velocity
    V = V0 + int(F,time);  %Velocity Vector
    %V.y = V(2);
    %Velocity = V.y(time);
    S = sqrt(sum(V.^2));  %Speed
    
    %Position
    X = X0 + int(V,time);
    
    %Energy
    E(1) = sqrt(sum((F.*X).^2));  %Potential Energy
    E(2) = 1/(2*m*S^2);  %Kinetic Energy
    TE = sum(E);  %Total Energy
    
	% Display plots of ball height, velocity, and energy
    figure
	subplot(2,2,1); plot(t,subs(X(2),t));
	title('Height of Ball vs. Time'); xlabel('time (s)'); ylabel('Height (m)');
	grid on
    
	subplot(2,2,2); plot(t,subs(S,t));
	title('Velocity vs. Time'); xlabel('time (s)'); ylabel('Velocity (m/s)');
	grid on
    
    subplot(2,2,3); plot(t,subs(E(1),t),'b',t,subs(E(2),t),'r');
	title('KE'); xlabel('time (s)'); ylabel('Kinetic Energy');
	grid on
    
	subplot(2,2,4); plot(t,subs(TE,t));
	title('PE'); xlabel('time (s)'); ylabel('Potential Energy');
	grid on
end