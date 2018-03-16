%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Function finds the root of f in the interval [a, b]
% using Regula Falsi Method
% f(a) and f(b) must have opposite signs
% Results are displayed at each interval
% USAGE:  xr = regulafalsi(f, a, b, tol, kmax)
% INPUT:
% f    = inline function
% a,b  = limits of search
% tol  = tolerance
% kmax = maximum number of iterations
% OUTPUT
% xr   = root estimate
% y   = function value
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function xr = regulafalsi (f, a, b, tol, kmax)
ya = f(a);
yb = f(b);
if sign(ya) == sign (yb)
    error ('function has same sign at end points')
end
disp('step       a          b           s         Err    ')
for k = 1:kmax
    xr = b - yb*(b -a)/(yb - ya);
    y = f(xr);
    iter = k;
    Err = abs(y);
    %print the header
    fprintf('%3i %11.6f %11.6f %11.6f %11.6f \n', iter,a,b,xr, Err)
    if Err < tol
        fprintf('regula falsi has converged after %d iterations: %f \n', iter,xr); break;
    end
    if sign(y) ~= sign(ya)
        b = xr;
        yb = y;
    else
        a = xr;
        ya = y;
    end
    if (iter >= kmax)
        disp ('zero not found to desired tolerance')
    end
end

