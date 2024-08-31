clc;
a = [-1, 4; 1, 8];
b = [29; 77];
c = [3, -2];
[m, n] = size(a);
s = eye(m);
A = [a s b];
cost = zeros(1, n+m+1);
cost(1: n) = c;
bv = n+1:1:n+m;
zcj = cost(bv) * A - cost;
res = [zcj; A];
simpt = array2table(res);
simpt.Properties.VariableNames(1:n+m+1) = {'x_1','x_2','s_1', 's_2', 'sol '}
