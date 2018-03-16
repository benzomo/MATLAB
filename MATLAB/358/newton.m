%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Function finds the root of f using Newton-Raphson
% Method. Starting with an initial estimate x1
% Results are displayed at each iteration
% USAGE:  xsol = Newton(fun, funpr, x1, tol, kmax)
% INPUT:
% fun  = function (inline function or m-file function)
% funpr=derivative function (inline or m-file)
% x1   = starting estimate
% tol  = allowable tolerance in the computed zero
% kmax = maximum number of iterations
% OUTPUT
% xn    The root to specified tolerance

function xn = newton(fun, funpr, x1, tol, kmax)
x(1) = x1;
y(1) = feval(fun, x(1));
ypr(1) = feval (funpr, x(1));
k=1;
iter = 1;
%Display the header
disp('iter      x(k)           x(k+1)             Err');
for k = 2:kmax
    x(k) = x(k-1) - y(k-1)/ypr(k-1);
    y(k) = feval(fun, x(k));
    Err = abs(x(k) - x(k-1));
    fprintf('%2i   %12.5f    %12.5f     %12.5f\n',iter, x(k-1), x(k),abs(Err));
    if Err < tol
        xn = x(k);
       fprintf('Newton-Raphson Method has converged after %d iterations \n', iter); break;
    end
    ypr(k) = feval(funpr, x(k));
    iter = k;
end
if (iter >= kmax)
        disp ('zero not found to desired tolerance')
end


