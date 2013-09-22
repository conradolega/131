function [a, b] = gss(x, m)
	a = 0
	b = 2 * %pi
	tau = (sqrt(5) - 1) / 2
	tau2 = 1 - tau
	x1 = a + tau2 * (b - a)
	f1 = trajectory(x1, x, m)
	x2 = a + tau * (b - a)
	f2 = trajectory(x2, x, m)
	while abs(b - a) > 0.00001
		if f1 > f2 then
			a = x1
			x1 = x2
			f1 = f2
			x2 = a + tau * (b - a)
			f2 = trajectory(x2, x, m)
            disp(f2)
		else
			b = x2
			x2 = x1
			f2 = f1
			x1 = a + tau2 * (b - a)
			f1 = trajectory(x1, x, m)
            disp(f1)
		end
	end
endfunction

function r = trajectory(theta, x, m)
    if m == 1 then
        r = x(1) / (1 + x(2) * sin(theta + x(3)))
    else
        r = -x(1) / (1 + x(2) * sin(theta + x(3)))
    end
endfunction
