// function [L, U] = lu(A)
	// Aorig = A
	// n = size(A, 'r')
	// P = perms([n:-1:1])
	// for p = 1:factorial(n)
		// A = Aorig(P(p, :), :)
		// L = eye(n, n)
		// for col = 1:n
			// for row = col+1:n
				// disp(row)
				// disp(col)
				// alpha = -A(row, col)/A(col, col)
				// L(row, col) = -alpha
				// A(row, col:$) = A(row, col:$) + alpha * A(col, col:$)
				// break
			// end
		// end
	// end
	// U = A
// endfunction

function [L, U] = lu_solve(A)
	Aorig = A
	n = size(A, 'r')
	L = eye(n, n)
	for col = 1:n
		for row = col+1:n
			disp(col)
			disp(row)
			alpha = -A(row, col)/A(col, col)
			L(row, col) = -alpha
			A(row, col:$) = A(row, col:$) + alpha * A(col, col:$)
		end
	end
	U = A
endfunction

// b = b(P(p, :))
// y = zeros(n, 1)
// y(1) = b(1)
// for i = 2:n
	// y(i) = b(i) - L(1:i-1) * y(1:i-1)
// end
// x = zeros(n, 1)
// x(n) = y(n) / A(n, n)
// for i = n-1:-1:1
	// x(i) = y(i) - U(i, i+1:n) * y(i + 1:n)/U(i, i)