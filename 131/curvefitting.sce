function [x, a1, a2, a3] = probset3(n)
	x = ones(n, 1)
	for i = 1:n
	  x(i) = (i - 1)/(n - 1)
	end

	a1 = ones(n, 1)

	a2 = ones(n, 1)
	for j = 0:n-1
	  a2(j + 1) = (-1)^j
	end

	a3 = zeros(n, 1)
	a3(1) = 1
	a3(n) = 1
endfunction