function epicycles( T1, Tratio, R, r )
    %plotdecay plots decaying circular motion.
    clc;
    
    %Assemble time array 't'
    Nc = 10; %number of cycles
    Ntpc = 200; %number of points per cycle
    tot_time = Nc*T1;
    Nt = Nc*Ntpc; %length of array time (number of times')
    t = linspace(0,tot_time,Nt);
    
    %Assemble equations. R for centered circle's radius, r for circulating
    %circle's radius.
    Rmax = R + r;
    T2 = T1/Tratio;
    omega1 = 2*pi/T1;
    omega2 = 2*pi/T2;
    x = R*cos(omega1*t) + r*cos(omega2*t);
    y = R*sin(omega1*t) + r*sin(omega2*t);
    
    plot(x,y); axis([-Rmax Rmax -Rmax Rmax]); grid on
    
    animateON = input('Do you want to see this plot animated? Enter 0 or 1: ');
    
    if animateON==1
        for it = 1:length(t)
            plot(x(1:it),y(1:it),'b',x(it),y(it),'ro',[0,x(it)],[0,y(it)],'g','MarkerSize',8,'MarkerFaceColor','r')
            axis([-Rmax Rmax -Rmax Rmax]), grid on
            xlabel('x')
            ylabel('y')
            title('Epicycle Animation')
            drawnow
        end
    end
end