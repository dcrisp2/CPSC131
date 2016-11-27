function vectorField(x,y)
    
    %Set Parameters
    Bmag = .3; %Tesla
    B = [0, 0, -Bmag]; %B-Field into the page (-Zhat)

	%Define grid using two opposite corners
    [X, Y]=meshcmd([0 -3], [6 3], 7); 
    
    %Compute Vector Field
    Rmag=sqrt(X.*X+Y.*Y); %distance from origin
    Vx = X; Vy = Y; Vz = 0;
    V = [Vx, Vy, Vz];
    F = prod(V,B);
    
    
end