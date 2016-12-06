function WCF = WindChill(T, V)
    
    WCF = 35.7 + 0.6*T' - 35.7*V.^0.16 + 0.43*T'*V.^0.16;
    [X,Y,WCF] = meshgrid(V,T,WCF);
    %for i = 0:length(Y)
    %WCF = 35.7 + 0.6*Y - 35.7*X^0.16 + 0.43*Y*X^0.16;
    for x = 1:length(X(1,:))
        for y = 1:length(Y(:,1))
            WCF(x,y) = 35.7 + 0.6*y - 35.7*x^0.16 + 0.43*y*x^0.16;
        end
    end
    
    WCF = [[0,V];T',WCF];
end