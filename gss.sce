function y = gss(r)
	a = 0
	b = 2 * %pi
	tau = (sqrt(5) - 1) / 2
	tau2 = 1 - tau
	x = a + tau2 * (b - a)
	f1 =
	x2 = a + tau * (b - a)
	f2 = 
	while (b - a) > 0.001
		if f1 > f2 then
			a = x1
			x1 = x2
			f1 = f2
			x2 = a + tau * (b - a)
			f2 = 
		else
			b = x2
			x2 = x1
			f2 = f1
			x1 = a + tau2 * (b - a)
			f1 = f
		end
	end
endfunction
