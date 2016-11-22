function [vargout] = SimpsonRule(X,fun,n)
    %trap takes function handle fun, and n steps over X to estimate the
    %integrand of fun over all X using the trapezoid metod.
    
    if mod(n,2)
        fprintf('\n"Vargin" n must be even if we are to have an odd number of points.');
        fprintf('\nYet, %i is odd. Breaking from function "SimpsonRule".\n',n);
        vargout = false;
        return;
    end
    
	% Determine step size using range of 'X' and number of steps 'n'
    a = X(1);
    b = X(length(X));
    h = (b-a)/n;
    
    %Initialize variables for first pass through loop.
    f_xa = fun(a);
    f_xb = fun(b);
    raw = (h/3)*(f_xa+f_xb);
	for i=1:n
        xi = a + (h*i);

        if i==n
            newval = 0;
        elseif mod(i,2)==0
            % IF i is even
            newval = (h/3)*2*fun(xi);
        else
            % IF i is odd
            newval = (h/3)*4*fun(xi);
        end

        raw = raw + newval;
    end
    
    % Plot function
    figure; ezplot(fun); title('Y = f(x)'),xlabel('X'); ylabel('Y');
    
    % Use trapz(X,Y) as reference to 'raw' estimate
    estimated = trapz(X,fun(X)); estimated_error = ((estimated-raw)/estimated)*100;
    syms X;
    error_fun = [-1/(180*n^4)]*[(b-a)^5]*diff(fun(X),X,4);
    error_limit = vpa(subs(error_fun,X,a+h));
    
    % Aggregate values for 'raw', 'estimated', and 'error' into vargout.
    % 
    vargout=[raw, estimated_error, error_limit];
    fprintf('\nUsing Simpsons 1/3, the raw calculation found the integral to be %f.',vargout(1));
    fprintf('\nThe estimated integral using trapz is %f.',vargout(2));
	fprintf('\nAnd the value of the error function is %f.\n\n',vargout(3));

end