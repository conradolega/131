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

function [conds, errs, iter] = probset2(n)
	conds = zeros(n, 1)
	errs = []
	for i = 2:n
		h = hilbert(i)
		conds(i) = cond(h)
		x = ones(i, 1)
		b = h * x
		[val, xp] = solvelinear(h, b)
		errs(i - 1, 1) = norm(x - xp) / norm(x)
		[xgs, iter(i - 1)] = gaussseidel(h, b)
		errs(i - 1, 2) = norm(x - xgs) / norm(x)
	end
endfunction

function [x, a1, a2, a3] = probset3(n, m)
	x = ones(n, 1)
	for i = 1:n
	  x(i) = (i - 1)/(n - 1)
	end

	a1 = ones(m, 1)
	a1 = normal_run(x, a1)

	a2 = ones(m, 1)
	for j = 0:m-1
	  a2(j + 1) = (-1)^j
	end
	a2 = normal_run(x, a2)

	a3 = zeros(m, 1)
	a3(1) = 1
	a3(m) = 1
	a3 = normal_run(x, a3)
endfunction

function an = normal_run(x, a)
	an = a
	v = monomial(x, size(a, 'r'))
	for i=1:3
		y = polynomial(x, a)
		an(:, 1 + i) = normal_lu(v, y)
		disp(an)
		an(:, 4 + i) = normal_qr(v, y)
		disp(an)
	end
endfunction

function at = normal_lu(v, y)
	vp = v' * v
	yp = v' * y
	at = lu_solve(vp, yp)
endfunction

function aq = normal_qr(v, y)
	[q, r] = gramschmidt(v)
	aq = backsub(r, q' * y)
endfunction
