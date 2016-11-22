function plotdecay( r0, tau, T, omega, x, y, r, t)
    %plotdecay plots decaying circular motion.
    clc;
    
    for it = 1:length(t)
        plot(x(1:it),y(1:it),'b',x(it),y(it),'ro',[0,x(it)],[0,y(it)],'g','MarkerSize',8,'MarkerFaceColor','r')
        axis([-r0 r0 -r0 r0]), grid on
        xlabel('x')
        ylabel('y')
        title('Decaying Circular Motion')
        drawnow
    end

end