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

function conds = probset2(n)
	conds = zeros(n, 1)
	for i = 1:n
		h = hilbert(i)
		conds(i) = cond(h)
		x = ones(i, 1)
		b = h * x
	end
endfunction