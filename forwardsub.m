function x = forwardsub(a, b)
%Input: a = n x n non-singular lower triangle matrix
%       b = n x 1 matrix
%Output: solution to x in Ax=b

%get the size of of b
%initialize x with a n x 1 matrix filled with 0's
n = length(b);
x = zeros(n,1);

x(1) = b(1)/a(1,1);
x(2) = (b(2)-a(2,1)*x(1))/a(2,2);
for i = 3:n
    x(i) = (b(i)-a(i,i-2:i-1)*x(i-2:i-1))/a(i,i);
end

