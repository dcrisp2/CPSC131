function [] = star( points )
    %points = 5;
    THETA = pi/2:0.8*pi:(pi/2)+(points)*0.8*pi;
    RHO = ones(1,points+1);
    
    polar(THETA,RHO);
end