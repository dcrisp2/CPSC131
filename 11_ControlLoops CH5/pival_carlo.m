function [ pival ] = pival_carlo( midx, midy, radmax, k )
    %pival_carlo Does monte carlo simulation to estimate the value of pi.
    %midx and midy are the middle points to the populated object (square
    %and circle), and radmax is the maximum radius of the circle and half
    %the total length||width of the square. k determines number of data
    %points as 10^k.
    
    N = 10^k
    
    x = 2*radmax*((midx - 0.5)+rand(N,1));
    y = 2*radmax*((midy - 0.5)+rand(N,1));
    figure('color','white');
    hold all
    
    x1 = x-midx;
    y1 = y-midy;
    radius_from_center = sqrt(x1.^2+y1.^2);
    m = 0;
    axis square;
    for i=1:N
        if radius_from_center(i)<=radmax
            m=m+1;
            plot(x(i),y(i),'b.');
        else
            plot(x(i),y(i),'r.');
        end
    end
    
    %m/(radmax*N)
    
    %Nin/N = pi*R^2/4*R^2 = pi/4
    pival = m*4*radmax^2/N
end
