//note that what's in the header is an example of something you can run to this function.
>> clc, clear; syms z; y1 = z^3 - 3*z + 4; y2 = 3*(z^2-z); draw_tangents(y1,y2,z)

function draw_tangents(y1,y2,var)
    ezplot(y1); hold on;
    ezplot(y2);
    y1diffx = diff(y1,var);
    y2diffx = diff(y2,var);
    sameSlopeAt = solve(sym(y1diffx==y2diffx),var);
    n = length(sameSlopeAt);
    slopes(1:n)=subs(y2diffx,var,sameSlopeAt(1:n));
    for i = 1:n
      if subs(y1,var,sameSlopeAt(i))==subs(y2,var,sameSlopeAt(i))
        yOffset(i) = subs(y1,var,sameSlopeAt(i))-slopes(i)*sameSlopeAt(i);
        TangentEquation(i) = slopes(i)*var + yOffset(i); ezplot(TangentEquation(i));
      end
    end
    
    hold off;
end