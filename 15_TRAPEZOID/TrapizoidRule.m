function [vargout] = TrapizoidRule(X,fun,n)
    %trap takes function handle fun, and n steps over X to estimate the
    %integrand of fun over all X using the trapezoid metod.
    Xlen = length(X);
    range = X(Xlen)-X(1);
    step = range/n;
    
    % Create a corresponding Y space to match with X
    Y = fun(X);
    
    %Initialize variables for first pass through loop.
    raw = 0;
    a = X(1);
    fa = fun(a);
    for i=1:n
       b = a + step;
       fb = fun(b);
       
       raw = raw + 0.5*(b-a)*(fb+fa);
       if i<n
           a = b;
           fa = fb;
       end
    end
    
    % Use trapz(X,Y) as reference to 'raw' estimate
    estimated = trapz(X,Y);
    error = abs((raw-estimated)/estimated)*100;
    
    % Aggregate values for 'raw', 'estimated', and 'error' into vargout.
    vargout=[raw, estimated, error];
    fprintf('\nThe raw calculation found the integral to be %f.\nThe trapz() estimate was %f.\nAnd the percent error between the two is %f.\n\n',vargout(:));
    
    
    % Plot function
    figure; plot(X,Y); title('Y = f(x)'),xlabel('X'); ylabel('Y');
end