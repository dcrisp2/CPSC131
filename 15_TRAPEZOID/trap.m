function [raw] = trap(X,fun,n)
    %trap takes function handle fun, and n steps over X to estimate the
    %integrand of fun over all X using the trapezoid metod.
    Xlen = length(X);
    range = X(Xlen)-X(1);
    step = range/n;
    
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
    
    plot(X,fun(X))
end