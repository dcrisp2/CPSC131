%TakeOrder.m greets customer, takes their name and their order.

name = input('Please enter your name: ','s');
%clc;

fprintf('Good evening, %s! The kitchen is cooking some good stuff in the back.\n',name)
apps = input('How may appetizers will I be getting for you today?\n');
salads = input('Anyone up for salads? How many can I put yall down for?\n');
twinkies = input('And how many fried twinkies?\n');
%clc

total = apps + salads + twinkies;
fprintf('\nFantastic. I have you down for %2.0f items total.\n\n',total)