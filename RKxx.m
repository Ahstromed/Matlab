%Solves differential equation By'''(t)=y''(t)+y'(t)+y(t) 
%uses order RK method 4
%The inputs are n (an integer ? 1 that is the order of the equation), T0 (the initial starting
%time), Tfinal (the ending time), B (the value of B), h (the step-size) and q0 (a vector of
%length n
function RKxx(n,T0, Tfinal, B, h, q0)

t = T0:h:Tfinal;             
if B == 0
    if n == 1
    qstar = 0
    return
    end
    X = zeros(n-1);
    for i = 1:n-2
        X(i,i+1) = 1;
    end
    X(n-1,:) = X(n-1,:) + 1;
    X(n-1,:) = X(n-1,:)/(-1);
    A = X;
    qstar = zeros(n-1,length(t));
    qstar(:,1) = q0(1:length(q0)-1);
else
    X = zeros(n); 
    for i = 1:n-1
      X(i,i+1) = 1;
    end
    X(n,:) = X(n,:) + 1;
    X(n,:) = X(n,:)/B;
    A = X;
    qstar = zeros(n,length(t)) ;
    qstar(:,1) = q0; 
end

for i=1:(length(t)-1)
  k1 = A*qstar(:,i);            
  q1 = qstar(:,i)+k1*h/2;          
  k2 = A*q1;
  q2 = qstar(:,i)+k2*h/2; 
  k3 = A*q2;
  q3 = qstar(:,i)+k3*h;
  k4 = A*q3;
  qstar(:,i+1) = qstar(:,i) + (k1+2*k2+2*k3+k4)*h/6;
end

qstar(1,end)


