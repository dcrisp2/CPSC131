% SimpleAnimation.m
%   move a particle represented ny a circle symbol
%   to illustrate the basics of animation
 
%%  set parameters
Nt = 100;  % Number of time steps
xmin = 0.1;
xmax = 0.9;
yval = 0.3;

%% create vector
x = linspace(xmin,xmax,Nt);
  
%% animate position
for it = 1:Nt
    plot(x(it),yval,'ro','MarkerSize',8,'MarkerFaceColor','r')
    axis([0 1 0 1]), grid on
    xlabel('x')
    ylabel('y')
    title('Motion of a Point')
    drawnow
end
