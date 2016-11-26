% Clean workspace and console
clear; clc;

% Re-set scriptname for re-run.
script = 'SimpsonScript.m';

% Instantiate variables
t=[1,2,3.25,4.5,6,7,8,8.5,9.3,10];
v=[5,6,5.5,7,8.5,8,6,7,7,5];
X = t; Xlen = length(X);
Y = v;
n = Xlen-1; %Using number of steps equal to length of array - 1.


if mod(n,2)
	isodd = 1; %isodd is 1, or true, when n is odd.
else
	isodd = 0;
end


% Determine step size using range of 'X' and number of steps 'n'
a = X(1); 
b = X(Xlen);
h = (b-a)/n;

% Initialize variables for first pass through loop.
A=h*(3/8);

f_xa = Y(1);
vals(1) = A*f_xa;

f_xb = Y(Xlen); 
vals(Xlen) = A*f_xb;

estimated = vals(1) + vals(Xlen); %Both first, and last points
for i=2:Xlen-1
    % Simpson's 3/8... 1-3-3-2-3-3-2-3-3-1 (or ...2-4-1 when n is odd)
    if mod(i,3)==0
        % IF i is divisible by 3
        vals(i) = A*2*Y(i);
    elseif isodd && i==n-2
        % IF n is odd, and i equals n-2
        vals(i) = A*4*Y(i);
    else
        % OTHERWISE
        vals(i) = A*3*Y(i);
    end
    
    estimated = estimated + vals(i);
end

% Use trapz(X,Y) as reference to 'real' estimate
real_trapz = trapz(X,Y);
error_trapz = ((real_trapz-estimated)/real_trapz)*100;

% Using simps.m from Garcia, Damien to get more accurate estimation of
% integral, at least more-so than from trapz.
real_simps = simps(X,Y);
error_simps = ((real_simps-estimated)/real_simps)*100;

vargout=[estimated, real_trapz, error_trapz, real_simps, error_simps];

% Plot function
figure; plot(X,Y); title('Y = f(x)'),xlabel('X'); ylabel('Y');

fprintf('\nUsing Simpsons 3/8, the integral was estimated to be %f.',vargout(1));
fprintf('\nThe function trapz() found the real value of the integral to be %f;\n\t...implying a %f%% error.',vargout(2:3));
fprintf('\nAnd function simps(), a function from Daimen Garcia on mathworks file exchange, finds the real value of the integral to be %f;\n\t...implying a %f%% error.\n\n',vargout(4:5));

