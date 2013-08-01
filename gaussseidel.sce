function [x_new, i] = gaussseidel(A, b)
	n = size(b, 'r')
	Q = tril(A)
	R = Q - A
	x_new = zeros(n, 1)
	x_old = zeros(n, 1)
	for i=1:20
		x_old = x_new
		x_new = forwardsub(Q, R * x_old + b)
		disp(x_old)
		disp(x_new)
	end
	d_k = norm(x_new - x_old)
	x_old = x_new
	x_new = forwardsub(Q, R * x_old + b)
	d_kp = norm(x_new - x_old)
	disp(d_k)
	disp(d_kp)
	w = 2 / (1 + sqrt(1 - (d_kp / d_k)))
	R = Q - w * A
	b = w * b
	disp(w)
	while norm(x_new - x_old) > 10^-6
		x_old = x_new
		x_new = forwardsub(Q, R * x_old + b)
	end
endfunction
