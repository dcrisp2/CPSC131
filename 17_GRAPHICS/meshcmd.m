function [ X , Y ] = meshcmd( LowPoint , HighPoint , Points )
    n = Points; %number of points
    %F = Function;
    low = LowPoint; %[1 10]
    high = HighPoint; %[6 15]
    length = high - low;
    
    x = linspace(low(1),high(1),n);
    y = linspace(low(2),high(2),n);
    
    [X,Y] = meshgrid(x,y);
    
    %F = input('\nEither enter a Z(n,n) matrix for use in X-Y surface plot.\n Or enter "0" to continue without plotting.\n');
    %F = X.*exp(-X.^2-Y.^2); %Example
    F = zeros(n,n); %Example of (n x n) matrix of zeros
    surf(X,Y,F);
end