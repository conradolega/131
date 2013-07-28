function x = forwardsub(L, b)
	n = size(L, 'r')
	x = zeros(n, 1)
	x(1) = b(1)
	for i=2:n
		x(i) = b(i) - L(i, 1:i-1) * x(1:i-1)
	end
endfunction

function x = backsub(U, b)
	n = size(U, 'r')
	x = zeros(n, 1)
	z = 1
	if U(n, n) == 0 then
		U(n, n) = poly(0, 's' + string(z))
		z = z + 1
		x(n) = U(n, n)
	else
		x(n) = b(n) / U(n, n)
	end
	for i = n-1:-1:1
		disp(U)
		x(i) = pdiv((b(i) - (U(i, i+1:$) * x(i+1:$))), U(i, i))
	end
endfunction