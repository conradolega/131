function y = polynomial(x, a)
	n = size(x, 'r')
	m = size(a, 'r')
	y = zeros(n, 1)
	for i=1:n
		y(i) = a(1)
		for j=1:m-1
			y(i) = y(i) + a(j + 1)*(x(i)^j)
		end
		y(i) = y(i) + (2 * rand() - 1)
	end
endfunction
