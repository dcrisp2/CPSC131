function drift(X,dist)
    
    dt = dist/X(2,3);
    
    X(1,:) = X(1,:)*(1+X(2,:)*dt);
    
    
    
    
    
end