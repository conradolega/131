function monomial = monomial(x, y)
	n = size(y, 'r')
	monomial = zeros(n, n)
	for i=1:n
		for j=0:n
			monomial(i, j + 1) = x(i)^j
		end
	end
endfunction