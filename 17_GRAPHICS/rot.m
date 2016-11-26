clf
%Rotate a line by pi, 2*pi

rp = [3 6; 1 2];
line(rp(1,:),rp(2,:));
axis([-8 8 -8 8]);
for theta = 0:pi/4:pi
	rotat=[cos(theta),sin(theta);-sin(theta) cos(theta)];
    %rot=[cos(theta),sin(theta);-sin(theta) cos(theta)];
	r = rotat*rp;
	line(r(1,:),r(2,:));
end