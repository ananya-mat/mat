clc
clear all
format short 
c = [2 5];
a = [1 4; 3 1; 1 1];
b = [24; 21; 9];
[m, n] = size(a);
s = eye(m); 
A = [a s b];
cost = zeros(1, n + m + 1);
cost(1:n) = c; 
BV = n + 1:1:n + m;
display(BV);
zjcj = cost(BV) * A - cost;
zcj = [zjcj; A];
simplex_table = array2table(zcj);
simplex_table.Properties.VariableNames(1:n + m + 1) = {'x1', 'x2', 's1', 's2', 's3', 'sol'};
flag = true;
while flag
    if any(zjcj > 0) 
        fprintf("Current BFS is not optimal\n");
        zc = zjcj(1:end-1);
        [Enter_val, pvt_col] = min(zc); % Find entering variable (min value)
        
        if all(A(:, pvt_col) <= 0)
            error('LPP is unbounded; all entries are <=0 in column %d', pvt_col);
        else
            sol = A(:, end);
            column = A(:, pvt_col);
            for i = 1:m
                if column(i) > 0
                    ratio(i) = sol(i) ./ column(i);
                else
                    ratio(i) = inf;
                end 
            end 
            [leaving_val, pvt_row] = min(ratio);
        end
        
        BV(pvt_row) = pvt_col;
        pvt_key = A(pvt_row, pvt_col);
        A(pvt_row, :) = A(pvt_row, :) ./ pvt_key; 
        for i = 1:m
            if i ~= pvt_row
                A(i, :) = A(i, :) - A(i, pvt_col) .* A(pvt_row, :); 
            end 
        end 
        zjcj = zjcj - zjcj(pvt_col) .* A(pvt_row, :); 
        zcj = [zjcj; A]; % Update tableau
        table = array2table(zcj);
        table.Properties.VariableNames(1:n + m + 1) = {'x1', 'x2', 's1', 's2', 's3', 'sol'};
    else
        flag = false; % Optimal solution found
        fprintf('The current BFS is optimal\n');
    end 
end

