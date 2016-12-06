function [X,Y,WCF] = WindChill(T, V)
    
    %WCF = 35.7 + 0.6*T' - 35.7*V.^0.16 + 0.43*T'*V.^0.16;
    [X,Y] = meshgrid(V,T);
    xn = length(X(1,:));
    yn = length(Y(:,1));
    for xi = 1:xn
        for yi = 1:yn
            WCF(yi,xi) = 35.7 + 0.6*Y(yi) - 35.7*X(xi).^0.16 + 0.43*Y(yi)*X(xi).^0.16;
        end
    end
    
    %WCF = [[0,V];T',WCF'];
    %%disp(WCF);
end