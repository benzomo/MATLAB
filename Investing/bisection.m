%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Function finds the root of f in the interval [a, b]
% using the Bisection Method
% f(a) and f(b) must have opposite signs
% Results are displayed at each interval
% USAGE:  xm = bisection(f, a, b, tol, kmax)
% INPUT:
% f    = inline function
% a,b  = limits of search
% tol  = tolerance
% kmax = maximum number of iterations
% OUTPUT
% xm   = root estimate
% ym   = function value
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function xm = bisection(f, a, b, tol, kmax)
ya = f(a);
yb = f(b);
if sign(ya) == sign (yb)
    error ('Error: The function has same sign at end points')
end
disp('Iter      a         b          xmid        Err        ')
for k = 1:kmax
    xm = (a + b)/2;
    ym = f(xm);
    iter = k;
    bound = (b - a)/2;
    %print the header
    Err = abs(ym);
    fprintf('%3i %11.6f %11.6f %11.6f %11.6f \n', iter,a,b,xm, Err)
    if Err < tol
        fprintf('bisection has converged after %d iterations: %f \n', iter,xm); break;
    end
    if sign(ym) ~= sign(ya)
        b = xm;
        yb = ym;
    else
        a  = xm;
        ya = ym;
    end
    if (iter >= kmax)
        disp ('zero not found to desired tolerance')
    end
end

