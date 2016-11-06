% Clean and clear workspace, reset scriptname for recall
clear; clc;
script = 'shifter';

% Shift num, and array
num = 3;
a = [10, 30, 50, 60 70, 80 19]

% Create new shifted array
len = length(a);
aNew = [a(num+1:len),zeros([1,len-num-1])]
