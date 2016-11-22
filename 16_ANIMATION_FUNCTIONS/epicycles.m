function epicycles( T1, Tratio, R, r, t)
    %plotdecay plots decaying circular motion.
    clc;
    
    Rmax = R + r;
    T2 = T1/Tratio
    omega1 = 2*pi/T1;
    omega2 = 2*pi/T2;
    x = r*cos(omega1*t) + r*cos(omega2*t);
    y = r*sin(omega1*t) + r*sin(omega2*t);
    
    plot(x,y); axis([-r0 r0 -r0 r0]); grid on
    
    animateON = input('Do you want to see this animated? Enter 0 or 1: ');
    
    if animateON==1
        for it = 1:length(t)
            plot(x(1:it),y(1:it),'b',x(it),y(it),'ro',[0,x(it)],[0,y(it)],'g','MarkerSize',8,'MarkerFaceColor','r')
            axis([-r0 r0 -r0 r0]), grid on
            xlabel('x')
            ylabel('y')
            title('Lissajous')
            drawnow
        end
    end

end