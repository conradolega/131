function [L, U] = lu_factor(A)
	Aorig = A
	n = size(A, 'r')
	L = eye(n, n)
	for col = 1:n
		for row = col+1:n
			alpha = -A(row, col)/A(col, col)
			L(row, col) = -alpha
			A(row, col:$) = A(row, col:$) + alpha * A(col, col:$)
		end
	end
	U = A
endfunction

function [y, x] = lu_solve(A, b)
	[L, U] = lu_factor(A)
	n = size(A, 'r')
	y = zeros(n, 1)
	y(1) = b(1)
	for i = 2:n
		y(i) = b(i) - L(i, 1:i-1) * y(1:i-1)
	end
	x = zeros(n, 1)
	x(n) = y(n) / U(n, n)
	for i = n-1:-1:1
		x(i) = (y(i) - (U(i, i+1:$) * x(i+1:$)))/U(i, i)
	end
endfunction