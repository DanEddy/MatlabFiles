% Question 1a, using Forward difference method to solve heat equation
% inputs:
%   [xl, xr]: Space interval
%   [yb, yt]: Time interval
%         h : Step size in space interval
%         k : Step size in time interval
% outputs:
%         w : solution

function w = heatequation(xl, xr, yb, yt, h, k)
% defining initial condition
icfun = @(x) exp(x);
% defining Boundary conditions
bc1fun = @(t) exp(2*t);
bc2fun = @(t) exp(2*t + 1);

% Defining diffusion coefficient
D = 2;
% Defining step sizes
M = (xr - xl) / h;
N = (yt - yb) / k;
m = M - 1;
n = N;

sigma = D * k/(h*h);
a = diag(1 - 2 * sigma * ones(m, 1)) + diag(sigma * ones(m-1, 1), 1);
a = a + diag(sigma * ones(m-1, 1), -1);
lside = bc1fun(yb + (0:n) * k);
rside = bc2fun(yb + (0:n) * k);
% Applying initial conditions to solution matrix
w(:,1) = icfun(xl + (1:m) * h)'; % initial conditions 
for j = 1:n 
  w(:,j+1) = a * w(:,j) + sigma * [lside(j); zeros(m-2,1); rside(j)]; 
end 
% Applying boundary conditions to final solutions
w = [lside; w; rside]; 
x = (0:m+1) * h;
t = (0:n) * k; 
% Plotting the 3D solution of W
figure(1)
subplot(1,2,1)
mesh(x,t,w')
% Defining plot attributes 
view(60,30);
title('Approximate Solution of Heat Equation using Forward Difference Method with k = 0.004')
xlabel('Domain: (x)')
ylabel('Time: (t)')
zlabel('Solution: u(x,t)')

% Defining exact solution 
exact_equation = @(t,x) exp(2*t + x);
%defining bounds
x = 0:h:1;
t = 0:k:1;
sol = zeros(length(t),length(x));
for i = 1:1:length(t)
    for j = 1:1:length(x)
        sol(i,j) = exact_equation(t(i),x(j));
    end
end

% Plotting exact solution
figure(1)
subplot(1,2,2)
mesh(x,t,sol)

% Defining plot attributes
view(60,30);
title('Exact Solution of Heat Equation')
xlabel('Domain: (x)')
ylabel('Time: (t)')
zlabel('Solution: u(x,t)')



