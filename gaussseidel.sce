function x = gaussseidel(A, b)
	w = 0.5
	Q = tril(A)
	R = Q - w * A
	wb = w * b
	Q * x_new = R * x_old - wb
end