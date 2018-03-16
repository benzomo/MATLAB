%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Function finds the root of f in the interval [a, b]
% using the Secant Method
% f(a) and f(b) need not have opposite signs. There is
% no guarantee that there is a zero in the interval.
% Results are displayed at each interval
% USAGE:  xs = secant(f, a, b, tol, kmax)
% INPUT:
% f    = inline function
% a,b  = limits of search
% tol  = tolerance
% kmax = maximum number of iterations
% OUTPUT
% xs   = root estimate
% ys   = function value
function xs = secant(f, a, b, tol, kmax)
% f is an inline function
y(1) = f(a);
y(2) = f(b);
x(1) = a;
x(2) = b;
Dx(1) = 0;
Dx(2) = 0;
disp('   step      x(k-1)     x(k)      x(k+1)     y(k+1)   Dx(k+1)    ')
for k = 2:kmax
    x(k+1) = x(k) - y(k)*(x(k) - x(k-1))/ (y(k) - y(k-1));
    y(k+1) = f(x(k+1));
    Dx(k+1) = x(k+1) - x(k);
    iter = k-1;
    out = [iter, x(k-1), x(k), x(k+1), y(k+1), Dx(k+1) ];
    disp ( out )
    xs = x(k+1);
    ys = y(k+1);
    if abs(y(k+1)) < tol 
        fprintf ('secant method has converged after %d iterations: %f \n', iter,xs); break;
    end
    if (iter >= kmax)
        disp ('zero not found to desired tolerance')
    end
end

