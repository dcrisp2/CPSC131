% Furniture.m Given 4 different sets of furnature, and values for number
% sold, their cost to both store and customer, calculate these values:
% Total sold, Total cost, and total profit.

% Clear Screen
clc;

% Cost of each set
Cs = [199, 268, 500, 670];

% Price of each set
Ps = [398, 598, 798, 998];

% Number of each set sold
Ns = [35, 25, 20, 10];

% Total sets sold, total revenue, and total profit
totalSold = 0;
totalRevenue = 0;
totalCost = 0;
totalProfit = 0;
for i = 1:4
	totalSold = totalSold + Ns(i);
	totalRevenue = totalRevenue + Ps(i)*Ns(i);
	totalCost = totalCost + Cs(i)*Ns(i);
	
	Prof(i) = (Ps(i)-Cs(i))*Ns(i);
	totalProfit = totalProfit + Prof(i);
	Prof(i) = totalProfit;
end

% Totals appended to arrays
Ns(5) = totalSold;
Ps(5) = totalRevenue;
Cs(5) = totalCost;
Prof(5) = totalProfit;


% Data Table
dataTable = [Ns; Ps; Cs; Prof];

% Display
fprintf('\t\tSetA\tSetB\tSetC\tSetD\tTOTALS\n');
fprintf('# Sold\t%3.0f\t\t%3.0f\t\t%3.0f\t\t%3.0f\t\t%5.0f\n',Ns(1),Ns(2),Ns(3),Ns(4),Ns(5));
fprintf('Revenue\t%3.0f\t\t%3.0f\t\t%3.0f\t\t%3.0f\t\t%5.0f\n',Ps(1),Ps(2),Ps(3),Ps(4),Ps(5));
fprintf('Cost\t%3.0f\t\t%3.0f\t\t%3.0f\t\t%3.0f\t\t%5.0f\n',Cs(1),Cs(2),Cs(3),Cs(4),Cs(5));
fprintf('Profit\t%3.0f\t%3.0f\t%3.0f\t%3.0f\t$%5.0f\n',Prof(1),Prof(2),Prof(3),Prof(4),Prof(5));