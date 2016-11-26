function rotate( Origin, Points, Degrees )
    %Rotate a given set of points entered as [p1;p2;p3] about the origin
    %using a linspace in degrees.
    
    %Convert vargins to more useful names
    o = Origin; %[0 0];
    pts = Points;
    deg = Degrees;
    
    %Set pts about origin, get magnitudes, close line by appending first
    %point to end of pts
    [lim,pts] = relate_inputs(o,pts);
    
    %Draw Lines
    plotline(pts);
    axis([-lim+o(1) lim+o(1) -lim+o(2) lim+o(2)]);
    Npts = length(pts(:,1));
    for theta = deg
        R = [cos(theta) -sin(theta);sin(theta) cos(theta)]; %2D Rotation matrix
        pts_new=R*pts(1:Npts,:)'; %Rotate points
        plotline(pts_new'); %Send pts_new to plotline as [pt1;pt2..]
    end
end

function plotline(pts)
    dim = length(pts(1,:));

    x = pts(:,1);
    switch dim
        case 2
            y = pts(:,2);
            line('XData',x,'YData',y);
        case 3 %IGNORE: havn't yet included 3D rotation matrix
            z = pts(:,2);
            line('XData',x,'YData',y,'ZData',z);
    end
end

function [lim,pts] = relate_inputs(o, pts)
    
    Npts = length(pts(:,1));
    r(1:Npts) = 0;
    for i = 1:Npts
        pts(i,:) = pts(i,:)-o(1,:);  %Shift points for rotation about origin
        r(i) = sqrt(sum(pts(i,:).^2));
    end
    pts(Npts+1,:)=pts(1,:);  %Close image by appending pts with duplicate of first.
    lim = max(r);
end