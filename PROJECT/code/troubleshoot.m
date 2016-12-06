fprintf('\nnums(1) is: %i',nums(1));
disp('\n');

nmin=nums(1)-20;
nmax=nums(1)+1;

time=T(nmin:nmax);
Xpos=Xn(nmin:nmax,1);
Ypos=Xn(nmin:nmax,2);
Zpos=Xn(nmin:nmax,3);

figure(4);
subplot(2,1,1);
    plot(time,Zpos);
    grid on;
    title('Distance vs Time');
    xlabel('time (s)');