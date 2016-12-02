function [Xn] = extend(Xn, i, dim)
%extend takes your array 'Xn' and if index i does not exist, it will extend
%the array to this index, and fill it with zero.
    switch dim
        case 1
            try 
                not(Xn(i));
            catch
                Xn(i) = 0;
            end
        case 2
            try 
                not(Xn(i,3));
            catch
                Xn(i,3) = 0;
            end
    end
    
end