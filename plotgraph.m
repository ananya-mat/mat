clc;
x = 0:10;
y = (5-2*x)/3;
y1= (7-3*x)/5;
plot(x,y, 'r-', x,y1,'k-')
xlabel('x')
ylabel('y')
legend('2x+3y=5', '3x+5y=7')