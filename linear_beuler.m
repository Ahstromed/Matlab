function [t, y] = linear_beuler(A, y0, h, T)
t = linspace(0,T,(T/h + 1));
I = eye(length(A));
y = zeros(length(A), length(t));
y(:,1) = y0;

for i = 2:length(t)
    y(:, i) = (I - h*A) \ y(:, i-1);
end
end