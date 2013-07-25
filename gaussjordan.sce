function [A, x] = gaussjordan(Y)
	n = size(Y, 'r')
	A = gaussian(Y)
	x = zeros(n, 1)
	x(n) = A(n, n+1)

	for i = n-1:-1:1
		x(i) = A(i, $) - A(i, i+1:n) * x(i+1:n)
	end

	for col = n:-1:2
		for row = col-1:-1:1
			A(row, row:$) = A(row, row:$) - A(row, col) * A(col, row:$)
		end
	end

	x = A(:,$)
endfunction

function x = solvelinear(A, b)
	[A, x] = gaussjordan([A b])
endfunction