function [ est, rawEst, comp] = TrapizoidRaw( X, Y, n)
    
    Xlen = length(X);
    step = floor(Xlen/n);
    
    steps(1)=1; est(1) = 0; rawEst(1) = est(1);
    for i=2:n+1
       steps(i)= 1+step*(i-1);
       
       if and(i==n+1,n>1)
           steps(i) = steps(i) + mod(Xlen-1,(step*n));
       elseif n==1
           steps(i) = step;
       end
       
       old=steps(i-1); new=steps(i);
       rawEst = rawEst + ((X(new)-X(old))/2)*(Y(old)+Y(new));
       est = est + trapz(X(old:new),Y(old:new));
       
       comp(1,i)=rawEst;
       comp(2,i)=est;
    end
    plot(X,Y);
end