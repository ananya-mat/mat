clc;
a=[1 -4; 1 8;1 0;0 1];
b=[-29; 77;0;0];
c=[3 -2];

x1 = 0:0.1:500;
x21 = b(1) - a(1,1)* x1/a(1,2);
x22 = b(2) - a(2,1)* x1/a(2,2);
x23 = b(3) - a(3,1)* x1/a(3,2);
x24 = b(4) - a(4,1)* x1/a(4,2);
plot(x1, x21, 'r-', x1,x22, 'r-', x1, x23, 'r-', x1, x24, 'r-');
sol = [];
for i=1:length(a)
    a1=a(i,:);
    b1=b(i);
    for j=i+1:length(a)
        a2 = a(j,:);
        b2 = b(j);
        a3 = [a1;a2];
        b3 = [b1;b2];
        X = inv(a3)*b3;
        sol = [sol,X];
    end 
end

fprintf("Solution:\n")
disp(sol);

obj = [];
X1 = sol(1,:);
X2 = sol(2,:);
C1 = find(X1 - 4*X2 > -29);
sol(:, C1) = [];

X1 = sol(1,:);
X2 = sol(2,:);
C2 = find(X1 + 8*X2 > 77);
sol(:, C2) = [];

X1 = sol(1,:);
X2 = sol(2,:);
C3 = find(X1<0);
sol(:, C3) = [];

X1 = sol(1,:);
X2 = sol(2,:);
C4 = find(X2<0);
sol(:, C4) = [];

X1 = sol(1,:);
X2 = sol(2,:);
sol = sol';
fprintf("Solution in Constraints:\n")
disp(sol);

for i=1:length(sol)
    obj(i) = sum(sol(i,:).*c);
end
[m, loc] = max(obj);
os = sol(loc,:);
fprintf("The optimal sol:\n");
disp(os);
fprintf("Max Value = %f\n", m);
