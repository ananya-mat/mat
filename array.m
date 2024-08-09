clc;
x=[1 2 3 4; 5 6 7 8; 9 0 1 2];
s = size(x);
disp(x)
disp(s)
u=0:2;
disp(u)
x=-pi:0.01:pi;
y=sin(x).^2;
plot(x,y, 'r')