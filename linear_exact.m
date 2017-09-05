function [t, y] = linear_exact(A, y0, h, T)

y = zeros(2,T/h);
t(1) = 0;
y(1,1) = y0(1);
y(2,1) = y0(2);
[v,d] = eig(A);
X = linsolve(v,y(:,1));

for i=1:(T/h)
y(1, i+1) = X(1)*v(1,1)*exp(t(i)*d(1,1))+X(2)*v(1,2)*exp(t(i)*d(2,2));
y(2, i+1) = X(1)*v(2,1)*exp(t(i)*d(1,1))+X(2)*v(2,2)*exp(t(i)*d(2,2));
t(i+1) = t(i) + h;
end;

end