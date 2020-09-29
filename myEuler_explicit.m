function [t_val, y_val] = myEuler_explicit(f, t0, tf, y0, h)
% Eulers Method - explicit version
%   - Explicit method for solving a first order ODE
%   - Calculated according to yn+1 = yn + h*f(tn, yn)
%
% Input:
%   f: Inline function handle
%   t0: Initial time point
%   tf: Final time point
%   y0: initial condition
%   h: step size
% Output:
%   t_val: Temporal location of each approximation
%   y_val: Corrosponding approximation of f at each temporal value.

% Determining if the correct number of inputs has been given
if nargin ~= 5
    error("myEuler requires 5 input arguments")
end

% Determining if function handle f has been correctly inputted
assert(isa(f, 'function_handle'), ...
    ('Please input f as a callable function'))

% Defining temporal values t_val
t_val = t0 : h : tf;

% Defining/creating empty array for approximations (y_val)
y_val = zeros(1, length(t_val));

% Defining initial values
y_val(1) = y0;

for i = 1:length(t_val)-1
    y_val(i+1) = y_val(i) + h * f(t_val(i), y_val(i));
end

