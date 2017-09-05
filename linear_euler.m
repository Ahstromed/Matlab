
function [t, y] = linear_euler(A, y0, h, T)
%t is row
%each column of y is each iteration

t = linspace(0,T,(T/h + 1));
y = zeros(length(A), length(t));
y(:,1) = y0;

for i = 2:length(t)
    y(:, i) = y(:, i-1) + h * A * y(:, i-1);
end

end
