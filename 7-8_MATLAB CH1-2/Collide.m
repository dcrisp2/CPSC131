function [ output_args ] = Collide( m1, m2, v1, v2 )
    %Collide: Given both mass and initial velocity of two objects, 
    % final velocities are given for an elastic collision.
    
    % Clear Console
    clc
    
    % Calculation
    v1f = ((m1-m2)/(m1+m2))*v1+((2*m2)/(m1+m2))*v2;
    v2f = ((2*m1)/(m1+m2))*v1+((m2-m1)/(m1+m2))*v2;
    
    % Display
    disp('=======================================')
	fprintf('\t\t\tElastic Collision\n')
	disp('=======================================')
    format = '%1.0f\t\t%4.0f\t%4.0f\t\t%4.0f\n';
    fprintf('#\t\tMass\tInitial V\tFinal V\n')
	fprintf(format,1,m1,v1,v1f)
	fprintf(format,2,m2,v2,v2f)
end

