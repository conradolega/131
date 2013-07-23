function x = probset1(A)
	m = size(A, 'r')
	n = size(A, 'c')
	
	if m == n then
		b = zeros(n, 1)
		x = solvelinear(A, b)
	else
		error("The matrix is not square.")
	end

endfunction