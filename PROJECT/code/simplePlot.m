function simplePlot( fig, text, Xn, tn)
    figure(fig);
    num = length(tn);
    
    %Of 2 subplots: 1st Column, 1st Row
    subplot(2,1,1);
    plot(tn(1:num),Xn(1:num,3));
    grid on
    title('Distance vs Time');
    xlabel('time (s)');
    ylabel('Z-hat distance (m)');
    
    %Of 2 subplots: 1st Column, 2nd Row
	subplot(2,1,2);
    plot(Xn(1:num,3),Xn(1:num,1)); %is evaluating as X@(t=8:12)
    grid on
	title('Transverse vs Longitudinal');
    xlabel('Z-hat distance (m)'); ylabel('X-hat distance (m)');
    
    %subtitle(text); %title gets put on top of plot 2-1-1.
end