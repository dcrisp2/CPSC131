%AUTHOR:        DANIEL CRISP
%DESC:          FINAL TEST
%filename:      final.m

%CONSOLE CLEAR:
clc;

%% Question 1

% Write a program to animate and trace the function:
% y = -2t + 1.5 for t=[-10, 10];

% n = 100;
% %t = -10:n:10;
% t = linspace(-10, 10, n);
% y = -2*t(1:n) + 1.5;
% axis([-10 10 -25 25]);
% for it = 1:n
%     plot(t(1:it), y(1:it));
%     axis([-10 10 -25 25]);
%     title('Question 1a')
%     drawnow
% end


%% Question 1b

% Find int(y,x) from x=[0 4] using composite simpson 1/3
% syms x;
% fun = @(x)x*exp(2*x);
% n = 10;
% 
% a = 0; x0 = a;
% b = 4;
% h = (b-a)/n;
% 
% for i=1:n
%     val = val + simpson_comp(fun, x0, h);
%     x0 = x0 + h;
% end

% using this defined in simpson_comp.m
% function [Y1] = simpson_comp(Y, x0, h)
%     syms x;
%     
%     A = h*(1/3);
%     x1 = x0;
%     x2 = x0+0.5*h;
%     x3 = x0+h;
%     
%     k1 = Y(x1);
%     k2 = Y(x2);
%     k3 = Y(x3);
%     
%     Y1 = A*(k1 + 2*k2 + k3);
% end

%OUTPUT: 1.1332e+04

%% Question 1c

% Find the roots, max and min for the following function using newton
% rraphson method
% syms x;
% fun = @(x) -2*x^3 - 3*x^2 + 0.5;
% tolerance = 0.01;
% start = 2;
% 
% figure(1);
% ezplot(fun); title('fun = -2*x^3 - 3*x^2 + 0.5');
% axis = ([-200 20 -20 20]);
% 
% df = diff(fun,x);
% ddf = diff(df,x);
% x0 = start;
% OK=1; i = 1; error = 100;
% while(OK)
%     x1 = x0 - (subs(fun,x,x0)/subs(df,x,x0));
%     error = abs((x0-x1)/x1)*100;
%     if(error<tolerance) OK = 0; end
%     i = i+1;
%     x0 = x1;
% end
% fprintf('\nGreat! Your root is %f, and has an error of %f\n\n', x0, error);
% 
% %OUTPUT:
% %Great! Your root is 0.366025, and has an error of 0.03%
% 
% % NOT DONE EDITING FOR MAX/MIN
% % MATLAB FUNCTION FREEZING ON 'tolerance = 0.5'...
% tolerance = 0.5;
% start = 2;
% x0 = start;
% OK=1; i = 1; error = 100;
% while(OK)
%     x1 = x0 - (subs(df,x,x0)/subs(ddf,x,x0));
%     error = abs((x0-x1)/x1)*100;
%     if(error<tolerance) OK = 0; end
%     i = i+1;
%     x0 = x1;
% end
% fprintf('\nGreat! Your max/min is %f, and has an error of %f\n\n', x0, error);



%% Question 2a

% function WCF = WindChill(T, V)
%     
%     %WCF = 35.7 + 0.6*T' - 35.7*V.^0.16 + 0.43*T'*V.^0.16;
%     [X,Y] = meshgrid(V,T);
%     xn = length(X(1,:));
%     yn = length(Y(:,1));
%     for xi = 1:xn
%         for yi = 1:yn
%             WCF(xi,yi) = 35.7 + 0.6*Y(yi) - 35.7*X(xi).^0.16 + 0.43*Y(yi)*X(xi).^0.16;
%         end
%     end
%     
%     WCF = [[0,V];T',WCF];
%     disp(WCF);
% end
% T = -20:5:55;
% V = 0:5:55;
% WCF = WindChill(T,V);

%OUTPUT:
%...very large table. Not putting it in here. see FINAL.docx.


%% Question 2b

% Write a program to create a meshgrid and sruface plot of the WCFs with
% the above ranges for temperature and wind speed. Use shading flat and
% your choice of collormap. Tite and label your plot. Note: this does not
% need to be part of your function from a.

T = -20:5:55;
V = 0:5:55;

%by changing function definition to:
%	function [X,Y,WCF] = WindChill(T, V)
%and commenting out this line: WCF = [[0,V];T',WCF'];
%   I get to have X Y and Z that work for Q-2a

%[X, Y, WCF] = WindChill(T,V);
tn = length(T);
vn = length(V);

fun = @(V,T) 35.7 + 0.6*T(1:) - 35.7*V(:).^0.16 + 0.43*T(:)*V(:).^0.16;
fun(V,T);

