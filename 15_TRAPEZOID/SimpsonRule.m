function [vargout] = SimpsonRule( method , X , fun , n )
    %SimpsonRule takes function handle fun, and n steps over X to estimate the
    %integrand of fun over all X using either 1/3 or 3/8 simpson methods.
    %Specify which--1/3 or 3/8--simpson method to use by stating 
    
    if mod(n,2)&&method==0 %mod(n,2) is 1, or true, when the number is even. method==0 for requesting 1/3 rule.
        fprintf('\n"Vargin" n must be even if we are to have an odd number of points for Simpsons 1/3 Rule.');
        fprintf('\nYet, %i is odd. Breaking from function "SimpsonRule".\n\n',n);
        fprintf('Try using method = 1 in SimpsonRule( method, X, fun, n) to execute Simpsons 3/8 Rule.\n\n');
        vargout = false;
        return;
    end
    
	% Determine step size using range of 'X' and number of steps 'n'
    a = X(1);
    b = X(length(X));
    h = (b-a)/n;
    
    % Initialize variables for first pass through loop.
    f_xa = fun(a);
    f_xb = fun(b);
    if method==0 A=h*(1/3); else A=h*(3/8); end
    estimated = A*(f_xa+f_xb); %Both first, and last points
	for i=1:n-1
        xi = a + (h*i);

        switch method
            case 0:
                if mod(i,2)==0
                    % IF i is even
                    newval = A*2*fun(xi);
                else
                    % IF i is odd
                    newval = A*4*fun(xi);
                end
            case 1:
                
        end

        estimated = estimated + newval;
    end
    
    % Plot function
    figure; ezplot(fun); title('Y = f(x)'),xlabel('X'); ylabel('Y');
    
    % Use trapz(X,Y) as reference to 'real' estimate
    real_trapz = trapz(X,fun(X));
    error_trapz = ((real_trapz-estimated)/real_trapz)*100;
    
    % Use simps.m from Garcia, Damien to get more accurate estimation of
    % integral. This function estimates more accurate values when entering
    % 'X = 0:4/100:4; fun = @(x) x.*exp(2*x); n=2; [result] = SimpsonRule(X,fun,n);'
    % compared to values on slide 17 of TrapezoidRule_thamira.ppt.
    % On this slide, the error = -57.96%, and 'real' value is 5216.926. 
    % In this case, simps.m calculates a value of 5216.928 rather than the 5220.503 from trapz.
    % Garcia, Damien's code is an extension of trapz() found at...
    % https://www.mathworks.com/matlabcentral/fileexchange/25754-simpson-s-rule-for-numerical-integration/content/simps.m
    real_simps = simps(X,fun(X));
    error_simps = ((real_simps-estimated)/real_simps)*100;
    
    % Calculate error bounds using err function
    %syms X;
    %error_function = [-1/(180*n^4)]*[(b-a)^5]*diff(fun(X),X,4);
    %error_limit = vpa(subs(error_function,X,a+h));
    
    % Aggregate values for 'raw', 'estimated', and 'error' into vargout.
    vargout=[estimated, real_trapz, error_trapz, real_simps, error_simps];
    
    % Display
    fprintf('\nUsing Simpsons 1/3, the integral was estimated to be %f.',vargout(1));
    fprintf('\nThe function trapz() found the real value of the integral to be %f;\n\t...implying a %f%% error.',vargout(2:3));
	fprintf('\nAnd function simps(), a function from Daimen Garcia on mathworks file exchange, finds the real value of the integral to be %f;\n\t...implying a %f%% error.\n\n',vargout(4:5));

end