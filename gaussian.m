function [x] = gauss(A,b)
% Program to return the Naive Gaussion elimination of augmentd matrix A|B.
%
% Parameter
%    A (Matrix) : The square matrix to be reduced.
%    b (Matrix) : The matrix of solutions to A
%
% Output
%    augmented matrix A|b reduced to row echelon form below the leading
%    diagonal.

%determing bounds on Matrix A
[n,m] = size(A);
if n ~= m; error('Matrix A is not square'); end
%forward elimination
for j = 1 : n-1
    if abs(A(j,j))<eps; error('Null diagonal element'); end
    %eliminating column j
    for i = j+1 : n
        multiplyer = A(i,j)/A(j,j);
        for k = j+1 : n
            A(i,k) = A(i,k) - multiplyer * A(j,k);
        end
        % ammending solution of row i 
        b(i) = b(i) - multiplyer * b(j);
    end
end
% back substitution
for i = n : -1 : 1
    for j= i+1 : n
        b(i) = b(i) - A(i,j)* x(j);
    end
    x(i) = b(i)/A(i,i);
end
        
