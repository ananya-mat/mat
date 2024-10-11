clc;
n = input("enter number: ");
%for i=start:step:end
for i=1:1:n
    if mod(i,2)==0
        fprintf('%d\n', i)
    end
end