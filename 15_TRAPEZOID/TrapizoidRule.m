function [ estimation ] = TrapizoidRule( X, Y, n)
    
    Xlen = length(X);
    step = floor(Xlen/n);
    
    steps(1)=1; estimation = 0;
    for i=2:n+1
       steps(i)= 1+step*(i-1);
       
       if and(i==n+1,n>1)
           steps(i) = steps(i) + mod(Xlen-1,(step*n));
       elseif n==1
           steps(i) = step;
       end
       
       estimation = estimation + trapz(X(steps(i-1):steps(i)),Y(steps(i-1):steps(i)));
    end
end