format long
% Defining components
m = 10000000;   % Number of points
r = 1;          % radius of n-sphere
n = 2:7;       % Dimensions
iter = 100;% Number of iterations (for greater accurace)
% defining exact solutions
analytcal_solution = [pi*r^2, (4*pi*r^4)/3, (pi^2*r^4)/2, ...
    (8*pi^2*r^5)/15, (pi^3*r^6)/6, (16*pi^3*r^7)/105];

for k = n
    % Solution matrix
    sol = [];
    for i = 1:iter
        x = rand(m,k);
        y_square = sum(x.^2, 2);
        % identify num of points within n-sphere radius
        sphere_points = length(find(y_square < r^2));
        % volume of n-dimensional box
        v_box = (2*r)^k;
        approx_volume = (v_box * sphere_points) / m;
        sol = [sol; approx_volume];
    end
    
    % Approximate volume of n-sphere
    volume = mean(sol);                % Average solution of all iterations
    text1 = ['Approximate volume of ', num2str(k),' dimensional sphere: ', num2str(volume)];
    
    % Statistical error:
    std_deviation = std(sol);          % standard deviation of solutions
    std_error = std_deviation / sqrt(iter);  % statistical error in result
    text2 = ['Standard Error: ', num2str(std_error)];
    
    % Actual error
    sol_error = abs(analytcal_solution(k-1) - volume);
    text3 = ['Solution Error: ', num2str(sol_error)];
    
    disp(text1)
    disp(text2)
    disp(text3)
end


