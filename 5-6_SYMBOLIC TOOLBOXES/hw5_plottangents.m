clc, clear; syms x; y1 = x^3 - 3*x + 4; y2 = 3*(x^2-x);
draw_tangent(y1,y2)

function draw_tangent(y1,y2)
    ezplot(y1); hold on;
    ezplot(y2);
    y1diffx = diff(y1,x);
    y2diffx = diff(y2,x);
    sameSlopeAt = solve(sym(y1diffx==y2diffx));
    slopes(1:length(sameSlopeAt))=subs(y2diffx,x,sameSlopeAt(1:length(sameSlopeAt)));
    for i = 1:length(sameSlopeAt)
      if subs(y1,x,sameSlopeAt(i))==subs(y2,x,sameSlopeAt(i))
        yOffset(i) = subs(y1,x,sameSlopeAt(i))-slopes(i)*sameSlopeAt(i);
        TangentEquation(i) = slopes(i)*x + yOffset(i); ezplot(TangentEquation(i));
      end
    end
    
    hold off;
end