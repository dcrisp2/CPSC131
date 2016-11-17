function vout=clipVec( v , vmin , vmax )
    %clipVec copies vector v to vout, but 'clips' values between
    %vmin and vmax.
    
    for i=1:length(v)
        if v(i)>vmax
            vout(i)=vmax;
        elseif v(i)<vmin
            vout(i)=vmin;
        else
            vout(i)=v(i);
        end
    end
end