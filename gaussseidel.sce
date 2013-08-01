function [x, i] = gaussseidel(A, b)
	n = size(b, 'r')
	Q = tril(A)
	R = Q - A
	x_new = ones(b, 1)
	x_old = ones(b, 1)
	for i=1:5
		x_old = x_new
		x_new = forwardsub(Q, R * x_old - b)
	end
	d_k = norm(x_new - x_old)
	x_old = x_new
	x_new = forwardsub(Q, R * x_old - b)
	d_kp = norm(x_new - x_old)
	w = 2 / (1 + sqrt(1 - (d_kp / d_k)))
	R = Q - w * A
	b = w * b
	while norm(x_new - x_old) > 10^-6
		x_old = x_new
		x_new = forwardsub(Q, R * x_old - b)
	end
end