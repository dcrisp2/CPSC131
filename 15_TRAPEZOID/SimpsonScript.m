% Clean workspace and console
clear; clc;

% Re-set scriptname for re-run.
script = 'SimpsonScript.m';

% Instantiate variables
t=[1,2,3.25,4.5,6,7,8,8.5,9.3,10];
v=[5,6,5.5,7,8.5,8,6,7,7,5];
method = 1;
n = 7;
X = t; X_end = length(X);
%fun = v; if v was a function handle
Y = v;

if mod(n,2)
	isodd = 1; %isodd is 1, or true, when n is odd.
else
	isodd = 0;
end


% Determine step size using range of 'X' and number of steps 'n'
a = X(1); 
b = X(X_end);
h = (b-a)/n;

% Initialize variables for first pass through loop.
A=h*(3/8);

f_xa = Y(1);
vals(1) = A*f_xa;

f_xb = Y(X_end); 
vals(n) = A*f_xb;

estimated = vals(1) + vals(n); %Both first, and last points

for i=1:n-1
    %xi = a + (h*i); Use index i+1 of Y to populate vals(i) with Y(i)
    xi = i+1;
    switch method
        case 0 % Simpson's 1/3... 1-4-2-4-2-4-1
            if mod(i,2)==0
                % IF i is even
                vals(i) = A*2*Y(xi);
            else
                % IF i is odd
                vals(i) = A*4*Y(xi);
            end
        case 1 % Simpson's 3/8... 1-3-3-2-3-3-2-3-3-1 (or ...2-4-1 when n is odd)
            if mod(i,3)==0
                % IF i is divisible by 3
                vals(i) = A*2*Y(xi);
            elseif isodd && i==n-2
                % IF n is odd, and i equals n-2
                vals(i) = A*4*Y(xi);
            else
                % OTHERWISE
                vals(i) = A*3*Y(xi);
            end
    end
    
    estimated = estimated + vals(i);
end

% Use trapz(X,Y) as reference to 'real' estimate
real_trapz = trapz(X,Y);
%real_trapz = trapz(X,fun(X));
error_trapz = ((real_trapz-estimated)/real_trapz)*100;

% Using simps.m from Garcia, Damien to get more accurate estimation of
% integral, at least more-so than from trapz.
real_simps = simps(X,Y);
error_simps = ((real_simps-estimated)/real_simps)*100;

vargout=[estimated, real_trapz, error_trapz, real_simps, error_simps];

% Plot function
figure;
%ezplot(X,fun(X));
plot(X,Y);
title('Y = f(x)'),xlabel('X'); ylabel('Y');


if method==0
    fprintf('\nUsing Simpsons 1/3, the integral was estimated to be %f.',vargout(1));
else
    fprintf('\nUsing Simpsons 3/8, the integral was estimated to be %f.',vargout(1));
end
fprintf('\nThe function trapz() found the real value of the integral to be %f;\n\t...implying a %f%% error.',vargout(2:3));
fprintf('\nAnd function simps(), a function from Daimen Garcia on mathworks file exchange, finds the real value of the integral to be %f;\n\t...implying a %f%% error.\n\n',vargout(4:5));

