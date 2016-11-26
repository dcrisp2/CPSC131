function [ X , Y ] = meshcmd( LowPoint , HighPoint , Points )
    n = Points; %number of points
    %F = Function;
    low = LowPoint; %[1 10]
    high = HighPoint; %[6 15]
    length = high - low;
    
    x = linspace(low(1),length(1),n);
    y = linspace(low(2),length(2),n);
    
    [X,Y] = meshgrid(x,y);
    F = input('\nEnter a Z(n,n) matrix for use in surf plot X-Y.\n');
    %F = X.*exp(-X.^2-Y.^2);
    %F = zeros(n,n); %zeros of matrix n x n
    
    surf(X,Y,F);
end