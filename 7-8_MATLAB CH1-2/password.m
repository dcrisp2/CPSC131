% password.m asks for user's first name, middle initial, last name, and
% 10-digit cell phone number. Then creates 6 char password using first
% character of first name, middle initial, and first two of the last name
% then the last two digits of the phone number. All letters lowercase.

% Clear Variables, and Screen
clear; clc;

% Request user's info
first = input('Please enter your name: ','s');
clc

fprintf('NAME:\n%s\n\n',first);
mid = input('Please enter your middle initial: ','s');
clc

fprintf('NAME:\n%s\t%s\n\n',first, mid);
last = input('Please enter your last name: ','s');
clc

fprintf('NAME:\n%s\t%s\t%s\n\n',first, mid, last);
phone = num2str(input('Please enter your 10 digit phone number: '));
clc

fprintf('NAME:\n%s\t%s\t%s\n\n',first, mid, last);
fprintf('NUMBER:\n%s\n\n', phone);

% Generate Password Segments
F = lower(first(1));
M = lower(mid(1));
L = lower(last(1:2));
to = numel(phone);
from = to - 2;
P = phone(from:to);

% Concatenate Segments, Display Password
fprintf('PASSWORD:\n%s%s%s%s\n\n',F,M,L,P)




