function MacLaurin(x,n)
% print headings and initial conditions
fprintf('values of t approximations v(t)\n')
%fprintf('%8.3f',t0),fprintf('%19.4f\n',v0)
v=x
% compute v(t) over n time steps using Euler’s method
for i=1:n
    v=v+1-x^n+(x^n/factorial(n))-(x^n/factorial(n))+(x^n/factorial(n))-(x^n/factorial(n));
    fprintf('%8.3f',v),fprintf('%19.4f\n',v)
end