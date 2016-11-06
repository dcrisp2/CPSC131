% Clean and clear workspace, re-institute script bisection for successive
% call.
clear; clc;
script = 'bisection.m';

% Instantiate variables, equation, request initial limits, find limit avg
mass = 65; v0 = 35; g = 9.81; t = 4.5; tolerance = 0.02;
syms c;


lower = input('Enter a lower limit expectation for c\n');
upper = input('Enter a upper limit expectation for c\n');
fprintf('\n\n%s\t%s\t\t%s\t\t\t%s\t\t%s\t\t\t%s\t\t%s\n','i','lower','vl','upper','vu','middle','vm');
middle=(upper+lower)/2;

i=1;
OK = 1; % simulate do-while which doesn't exist in matlab. Think 'while OK to loop'
while (OK)
    
    % Calculate function values for each estimated point
    vl = sqrt(g*mass/lower)*tanh(t*sqrt(g*lower/mass))-v0;
    vu = sqrt(g*mass/upper)*tanh(t*sqrt(g*upper/mass))-v0;
    vm = sqrt(g*mass/middle)*tanh(t*sqrt(g*middle/mass))-v0;
    
    fprintf('%d\t%1.7f\t%1.7f\t%1.7f\t%1.7f\t%1.7f\t%1.7f\n',i,lower,vl,upper,vu, middle, vm);
    i=i+1;
    
    if (vl*vm>0)
        % IF lower and middle estimations result on the same side of
        % the x axis, decrease range between lower and upper by setting
        % lower value to middle value.
        lower = middle;
    else
        % IF first case is false, and the assumption that lower and upper
        % values are on opposite sides of x axis is true, then we can
        % decrease the range between them by setting upper value with
        % middle.
        upper = middle;
    end
    
    % Calculate new middle point
    newMid = (upper+lower)/2;
    
    % If percent difference between the last middle point and this one is
    % lower than tolerance value, set OK to false to exit loop.
    if (abs((middle-newMid)/newMid)<tolerance) OK = 0; end
    
    % Loop to either begin, or exit, with new middle value
    middle = newMid;
end

% Display
fprintf('\nEstimation complete. Solution is %2.7f\n\n',middle);