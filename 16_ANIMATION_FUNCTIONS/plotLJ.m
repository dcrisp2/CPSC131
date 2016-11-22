function plotLJ( r0, T, phi, a, b, t)
    %plotdecay plots decaying circular motion.
    clc;
    
    R = r0;
    omega = 2*pi/T;
    x = R*cos(a*omega*t);
    y = R*sin(b*omega*t + phi);
    
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