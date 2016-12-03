function justPlot( fig, P1x, P1y, P2x, P2y)
%justPlot simply plots 2 subplots in figure 'fig'. Plot1 is made of
%(P1x,P1y), and plot2 is (P2x,P2y).
    figure(fig);
    subplot(2,1,1);
    plot(P1x,P1y);
        grid on
        title('Distance vs Time');
        xlabel('time (s)');
        ylabel('Z-hat distance (m)');
    
    subplot(2,1,2);
    plot(P2x,P2y);
        grid on
        title('Transverse vs Longitudinal');
        xlabel('Z-hat distance (m)'); ylabel('X-hat distance (m)');
end