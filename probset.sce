function [A, x] = probset1(A)
	m = size(A, 'r')
	n = size(A, 'c')
	
	if m == n then
		b = zeros(n, 1)
		[A, x] = solvelinear(A, b)
	else
		error("The matrix is not square.")
	end
endfunction

function [conds, errs] = probset2(n)
	conds = zeros(n, 1)
	errs = []
	for i = 2:n
		h = hilbert(i)
		conds(i) = cond(h)
		x = ones(i, 1)
		b = h * x
		[val, xp] = solvelinear(h, b)
		errs(i - 1, 1) = norm(x - xp) / norm(x)
		disp(norm(x - xp) / norm(x))
		// disp(rref([h b]))
	end
endfunction

function [x, a1, a2, a3] = probset3(n, m)
	x = ones(n, 1)
	for i = 1:n
	  x(i) = (i - 1)/(n - 1)
	end

	a1 = ones(m, 1)
	a1t = normal_lu(x, a1)
	disp(a1t)
	a2 = ones(m, 1)
	for j = 0:m-1
	  a2(j + 1) = (-1)^j
	end
	a2t = normal_lu(x, a2)
	disp(a2t)
	a3 = zeros(m, 1)
	a3(1) = 1
	a3(m) = 1
	a3t = normal_lu(x, a3)
	disp(a3t)
endfunction

function at = normal_lu(x, a)
	y = polynomial(x, a)
	v = monomial(x, size(a, 'r'))
	vp = v' * v
	yp = v' * y
	at = lu_solve(vp, yp)
endfunction
