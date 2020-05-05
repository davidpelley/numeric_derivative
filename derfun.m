function df = derfun(f,x,h,O,dir)
% derfun: Numerical calculation of first derivative
% df = derfun(f,x,h,O,dir)
%
% Inputs:
% f = function to differentiate
% x = location at which to evaluate derivative
% h = step size
% O = order of accuracy (1,2 or 4)
% dir = string indicating direction,'f' 'b' 'c'
% Outputs:
% df = numerical estimation of the derivative

% Created by: David Pelley
% 11/10/2019
if O == 1
    if dir == 'f'
        df = (f(x+h)-f(x))/h;
    elseif dir == 'b'
        df = (f(x)-f(x-h))/h;
    else
        error('Only forward and back difference for O(h)')
    end
elseif O == 2
    if dir == 'f'
        df = (-f(x+2*h)+4*f(x+h)-3*f(x))/(2*h);
    elseif dir == 'b'
        df = (3*f(x)-4*f(x-h)+f(x-2*h))/(2*h);
    elseif dir == 'c'
        df = (f(x+h)-f(x-h))/(2*h);
    else
        error('Incorrect direction given')
    end
elseif O == 4
    if dir == 'c'
        df = (-f(x+2*h)+8*f(x+h)-8*f(x-h)+f(x-2*h))/(12*h);
    else
        error('Only centered difference for O(h^4)')
    end
else
    error('Function only designed for O(h), O(h^2) and O(h^4)')
end

