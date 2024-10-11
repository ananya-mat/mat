clc;
a=input("Enter a number: ");

if mod(a, 2) ~= 0
    fprintf('%d is odd', a)
elseif mod(a, 2) == 0
    fprintf('%d is even', a)
end
fprintf('\n')