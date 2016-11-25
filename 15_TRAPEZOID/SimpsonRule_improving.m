function [vargout] = SimpsonRule( plotfun, method , X , fun , n )
    %SimpsonRule takes function handle fun, and n steps over X to estimate the
    %integrand of fun over all X using either 1/3 or 3/8 simpson methods.
    %Specify which--1/3 or 3/8--simpson method to use by stating either 0 or 1.
    %When plotfun=0, the function will not be plotted. 
    
    if mod(n,2)
        isodd = 1; %isodd is 1, or true, when n is odd.
    else
        isodd = 0;
    end
    
    if method==0 && isodd %method==0 for requesting 1/3 rule.
    	fprintf('\n"Vargin" n must be even if we are to have an odd number of points for Simpsons 1/3 Rule.');
    	fprintf('\nYet, %i is odd. Switching the method argument to 1 and continuing with the 3/8 Rule.\n\n',n);
    	method=1;
    end
    if method==1 && n<3
    	fprintf('\n"vargin" n must be 3 or greater to use Simpsons 3/8 rule.');
    	fprintf('\nYet, %i is not. Breaking from function "SimpsonRule".',n);
    	fprintf('\n\nIf n=2, try using method=0 for Simpsons 1/3, or make n equal 3 or greater\n\n');
    	vargout(1:5) = 0;
        return;
    end
    
	% Determine step size using range of 'X' and number of steps 'n'
    a = X(1);
    b = X(length(X));
    h = (b-a)/n;
    
    % Initialize variables for first pass through loop.
    f_xa = fun(a);
    f_xb = fun(b);
    if method==0
        A=h*(1/3);
    else
        A=h*(3/8);
    end
    estimated = A*(f_xa+f_xb); %Both first, and last points
	for i=1:n-1
        xi = a + (h*i);
        
        switch method
            case 0 % Simpson's 1/3... 1-4-2-4-2-4-1
                if mod(i,2)==0
                    % IF i is even
                    newval = A*2*fun(xi);
                else
                    % IF i is odd
                    newval = A*4*fun(xi);
                end
            case 1 % Simpson's 3/8... 1-3-3-2-3-3-2-3-3-1 (or ...2-4-1 when n is odd)
                if mod(i,3)==0
                    % IF i is divisible by 3
                    newval = A*2*fun(xi);
                elseif isodd && i==n-2
                    % IF n is odd, and i equals n-2
                    newval = A*4*fun(xi);
                else
                    % OTHERWISE
                    newval = A*3*fun(xi);
                end
        end

        estimated = estimated + newval;
    end
    
    % Use trapz(X,Y) as reference to 'real' estimate
    real_trapz = trapz(X,fun(X));
    error_trapz = ((real_trapz-estimated)/real_trapz)*100;
    
    % Using simps.m found on mathworks' file exchange as appears more accurate than trapz. See function for
    % details.
    [real_simps, error_simps] = call_simps(X,fun,estimated);
    
    % Calculate error bounds using err function.
    % Though, not currently using error_limit.
    error_limit = errorlim(a,b,a+h,X,fun,n);
    
    % Aggregate values for 'raw', 'estimated', and 'error' into vargout.
    vargout=[estimated, real_trapz, error_trapz, real_simps, error_simps];
    
    % Display
	display( plotfun, method, fun, vargout );

end

function display( plotfun, method, fun, vargout)
    
    % Plot function
    if plotfun == 1
        figure; ezplot(fun); title('Y = f(x)'),xlabel('X'); ylabel('Y');
    end
    
    % Display text output
    if method==0
        fprintf('\nUsing Simpsons 1/3, the integral was estimated to be %f.',vargout(1));
    else
        fprintf('\nUsing Simpsons 3/8, the integral was estimated to be %f.',vargout(1));
    end
    fprintf('\nThe function trapz() found the real value of the integral to be %f;\n\t...implying a %f%% error.',vargout(2:3));
	fprintf('\nAnd function simps(), a function from Daimen Garcia on mathworks file exchange, finds the real value of the integral to be %f;\n\t...implying a %f%% error.\n\n',vargout(4:5));

end

function [error_limit] = errorlim(a,b,evalAt,X,fun,n)
    syms X;
    error_function = [-1/(180*n^4)]*[(b-a)^5]*diff(fun(X),X,4);
    error_limit = vpa(subs(error_function,X,evalAt)); %Had defaulted to using a+h for evalAt
end

function [real_simps, error_simps] = call_simps(X,fun,estimated)
    % Using simps.m from Garcia, Damien to get more accurate estimation of
    % integral, at least more-so than from trapz.
    % Even though it is an extension of matlab's trapz(). Code was found at...
    % https://www.mathworks.com/matlabcentral/fileexchange/25754-simpson-s-rule-for-numerical-integration/content/simps.m
    if exist('simps.m','file')
        real_simps = simps(X,fun(X));
        error_simps = ((real_simps-estimated)/real_simps)*100;
    else
        fprintf('\nsimps.m not found. real_simps and error_simps set to 0.\n');
        real_simps = 0;
        error_simps = 0;
    end
    
end