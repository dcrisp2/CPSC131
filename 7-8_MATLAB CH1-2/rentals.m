% rentals.m Using car rental data for three locations, calculate and
% display the total number of rental days at each location and overall, then do the same for revenue.

% Clear Screen
clc;

% data
Cars = ['compacts', 'full-sized', 'vans', 'suvs'];
perDay = [25, 38, 53, 72];

daysAtAirport = [250, 150, 180, 86];
daysAtCampus = [160, 44, 60, 20];
daysAtElkhart = [210, 112, 120, 78];

% Total number of rental days at each location
totalDaysAirport = 0;
totalRevAirport = 0;
totalDaysCampus = 0;
totalRevCampus = 0;
totalDaysElkhart = 0;
totalRevElkhart = 0;

% process
for i = 1:4
    totalDaysAirport = totalDaysAirport + daysAtAirport(i);
    totalRevAirport = totalRevAirport + perDay(i)*daysAtAirport(i);
    
    totalDaysCampus = totalDaysCampus + daysAtCampus(i);
    totalRevCampus = totalRevCampus + perDay(i)*daysAtCampus(i);
    
    totalDaysElkhart = totalDaysElkhart + daysAtElkhart(i);
    totalRevElkhart = totalRevElkhart + perDay(i)*daysAtElkhart(i);
end
totalDays = totalDaysAirport + totalDaysCampus + totalDaysElkhart;
totalRevenue = totalRevAirport + totalRevCampus + totalRevElkhart;

% display
fprintf('\nTotal number of rental days at each location:\n');
fprintf('Airport:\t%2.0f\n',totalDaysAirport);
fprintf('Campus:\t\t%2.0f\n',totalDaysCampus);
fprintf('Elkhart:\t%2.0f\n\n',totalDaysElkhart);

fprintf('Total number of rental days throughout the company: %3.0f\n\n',totalDays);

fprintf('\nTotal amount of revenue from each location:\n');
fprintf('Airport:\t$%2.0f\n',totalRevAirport);
fprintf('Campus:\t\t$%2.0f\n',totalRevCampus);
fprintf('Elkhart:\t$%2.0f\n\n',totalRevElkhart);

fprintf('Total amount of revenue earned throughout the company: $%3.0f\n\n',totalRevenue);