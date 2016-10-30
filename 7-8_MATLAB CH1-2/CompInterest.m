function [ output_args ] = CompInterest( P, r, k, Ny )
%CompInterest Analyze the limit for compound interest
%   Using Value of interest-bearing investment of principle, P, after Ny
%   years, 'k' compound frequency per year, and 'r' interest rate.
    
    % Clear Console
    clc
    
    % Calculation
    V = P*(1+r/k)^(k*Ny);
    
    % Display
	disp('=======================================')
	fprintf('\t\t\tCompInterest\n')
	disp('=======================================')
	fprintf('\tPrinciple\t= $%4.2f\n',P)
	fprintf('\tRate\t\t= %4.2f\n',r)
	fprintf('\tComp.Freq.\t= %4.0f\n',k)
	fprintf('\tYears\t\t= %4.1f\n',Ny)
	fprintf('\tValue\t\t= $%4.2f\n\n\n',V)  
    
end

