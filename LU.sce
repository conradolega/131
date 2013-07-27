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
	y = forwardsub(L, b)
	x = backsub(U, y)
endfunction