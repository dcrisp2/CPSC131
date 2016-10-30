function [ z1, z2 ] = quadroots( a, b, c )
    %quadroots: takes the coefficients for a given quadratic, and displays
    %it's roots.
    clc
    coeff = [a;b;c];
	theRoots = roots(coeff);
	
	disp('================')
	disp('Quadratic Solver')
	disp(' ')
	disp('coefficients')
	fprintf('\ta = %3.1f\n', coeff(1))
	fprintf('\tb = %3.1f\n', coeff(2))
	fprintf('\tc = %3.1f\n', coeff(3))
	disp('roots')
	fprintf('\tz1 = %4.2f\n', theRoots(1))
	fprintf('\tz2 = %4.2f\n', theRoots(2))
end

