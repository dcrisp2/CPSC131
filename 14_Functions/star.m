function star( num, step )
    %polar plot with 'num' points, and 'step' value rotational sizing for the steps between
    %them. Plot starts at 90deg. Make sure to use pi*(something) instead of
    %degrees.

    start=pi*(1/2); step=step;
    THETA = start:step:start+step*num;
    
    RHO = ones(1,num+1);
    
    polar(THETA,RHO);
end