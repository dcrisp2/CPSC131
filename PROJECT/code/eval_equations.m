function [Vn, Xn, tn] = eval_equations(q,a,Vn, B, Xn, L, tn, h)
    %NOTE: set_equations already ran before entering this function
    %NOTE: removed A as input, and An as output.
    %NOTE: B must be for the given region. a 1x3 vector
    %Make sure to start with a set of similar indexed values
    num = length(tn);
    if num>1 i=num; else i = 1; end %Always start with existing values
    tn(i) = tn(num);
    
    [~, V, X ] = get_equations(q,a,Vn(i,:),B,Xn(i,:));
    syms t; %For use of t in line 20.
    [Vn(i,:), Xn(i,:) ] = get_values(X,V,tn(i));
    
    i = i+1;
    Xn = extend(Xn,i);
    %Create a full 3-dim matrix of evaluations
    while Xn(i,3)<=L %NOTE: line 18 will make this true every time
        
        [Xn(i,:), tn(i)] = RungeKutta4(X,V,tn(i-1),h); %Return new position
        Vn(i,:) = eval(subs(V,t,tn(i)));
        if Xn(i,3)<L %Only advance Xn if expecting another loop.
            i = i+1;
        	Xn = extend(Xn,i);
        end
    end
end

function [Xn] = extend(Xn, i)
    try 
    	not(Xn(i,3))
    catch
    	Xn(i,3) = 0;
    end
end