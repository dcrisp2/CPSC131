% rotateDumbbell
%   Make hgtransform object and rotate it
%   around object center which is displaced
%   from the origin.
%
%% create two spheres connected by a line
[X,Y,Z]=sphere(12);
hs1=surf(X,Y,Z,'FaceColor',[0.9 0.9 0.9]);
hold on
   hs2=surf(X+3,Y,Z,'FaceColor',[0.6 0.6 0.6]);
   hs3=surf(X+1.5,Y+2.5981,Z,'FaceColor',[0.3 0.3 0.3]);
hold off
axis equal
 
hL1=line([1 2],[0 0],[0 0],'LineWidth',7);
A = cos(pi/3); B = sin(pi/3);
hL2=line([1*A 2*A],[1*B 2*B],[0,0],'LineWidth',7);
hL3=line([1*A+1.5 2*A+1.5],[2*B 1*B],[0,0],'LineWidth',7);
axis([-2 4 -2 4 -2 3]);
xlabel('x');ylabel('y');zlabel('z')
 
%% aggregate into Dumbbell object
hDumbbell=hgtransform('Parent',gca);
set(hs1,'Parent',hDumbbell);
set(hs2,'Parent',hDumbbell);
set(hs3,'Parent',hDumbbell);
set(hL1,'Parent',hDumbbell);
set(hL2,'Parent',hDumbbell);
set(hL3,'Parent',hDumbbell);
drawnow
%% rotate around center of dumbbell
%     at r=(1.5, 0, 0)
Delta=[1.5, 0, 0];
Nth=60;
theta=linspace(0,0.2*10*pi,Nth);
v=1
for ith=1:Nth
    Mt1=makehgtform('translate',-Delta);
    M=makehgtform('yrotate',theta(ith));
    Mt2=makehgtform('scale',[v, v, v]);
    set(hDumbbell,'Matrix',Mt2*M*Mt1);
    drawnow
    pause(0.1);
end
