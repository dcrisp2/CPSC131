function ezTrace( fig, text, X, tmin, tmax)
    figure(fig);
    syms t;
    
    %Of 2 subplots: 1st Column, 1st Row
    subplot(2,1,1);
    ezplot(X(3),[tmin tmax]);
    grid on
    title('Distance vs Time');
    xlabel('time (s)');
    ylabel('Z-hat distance (m)');
    
    %Of 2 subplots: 1st Column, 2nd Row
	subplot(2,1,2);
    Zmin = eval(subs(X(3),t,tmin));
    Zmax = eval(subs(X(3),t,tmax));
    ezplot(X(1),[Zmin Zmax]); %is evaluating as X@(t=8:12)
    grid on
	title('Transverse vs Longitudinal');
    xlabel('Z-hat distance (m)'); ylabel('X-hat distance (m)');
    
    %subtitle(text); %title gets put on top of plot 2-1-1.
end