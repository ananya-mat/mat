clc;
mat1 = input('Enter matrix A: '); 
mat2 = input('Enter matrix B: ');
x= -100:0.2:100;
h= size(mat1, 1); 

for i = 1:h-1  
    y1 = (mat2(i,1)-mat1(i,1)*x)/mat1(i,2);
    y2 = (mat2(i+1,1)-mat1(i+1,1)*x)/mat1(i+1,2);
    plot(x, y1, 'r-', x, y2, 'k-');
end

xlabel('x');
ylabel('y');
legend('Line from mat1', 'Line from mat2');

