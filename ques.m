clc;
mat1 = input("Enter matrix A: ");
mat2 = input("Enter matrix B: ");
x=1:0.2:max(mat2);
h=height(mat1);
for i=1:1:h-1  
    y=(mat2(i,1)-mat1(i,1)*x)/mat1(i,2);
    y2=(mat2(i+1,1)-mat1(i+1,1)*x)/mat1(i+1,2);
    plot(x,y,'r-',x,y1,'k-');
end
