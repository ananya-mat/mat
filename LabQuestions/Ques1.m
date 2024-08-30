clc;
a = [-1 4 -1 0; 1 8 0 1];
b =[29; 77];
c = [3 -2 0 0];
[m,n] = size(a);
sol = [];
if(n>m)
    ncm = nchoosek(n,m);
    pair = nchoosek(1:n,m);
    for i=1:ncm
        y=zeros(n,1);
        x=inv(a(:,pair(i, :))) * b;
        if all(x>=0 & x~=inf & x~= inf)
            y(pair(i,:)) = x;
            sol = [sol, y];
        end
    end
else
    fprintf("error\n");
end

disp(sol);