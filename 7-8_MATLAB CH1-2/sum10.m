%sum10 Sums user specified number with 9 successive values.

% Clear Console
clc

% Input
prompt = 'Please enter a number: ';
x = round(input(prompt));


% Retrieve next 9 numbers, and sum them
sum = 0;
for i = 1:10
    sumnums{i} = x + i - 1;
    sum = sum + sumnums{i};
end

% Output
disp('=======================================')
fprintf('\t\t\tsum10\n')
disp('=======================================')
fprintf('The sum of %2.0f and the next 9 numbers is %2.0f\n\n',x,sum)