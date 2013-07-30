function monomial = monomial(x, m)
	n = size(x, 'r')
	monomial = zeros(n, m)
	for i=1:n
		for j=0:m-1
			monomial(i, j + 1) = x(i)^j
		end
	end
endfunction
