function [ f ] = gforce( m1 , m2 , dist )
    clc
    
    % Gravitational Constant
    G = 6.67300*10^-11;
    
    % Force of Gravity
    f = G*m1*m2/(dist^2);
    
    % Display
    disp('Force of Gravity')
    fprintf('\tG\t\t= %4.12f\n',G)
    fprintf('\tMass#1\t= %4.0f\n',m1)
    fprintf('\tMass#2\t= %4.0f\n',m2)
    fprintf('\tdist\t= %4.1f\n',dist)
    fprintf('\tFORCE\t= %4.12f\n\n\n',f)
end
