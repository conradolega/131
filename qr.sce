function [q, r] = qr(a)
	[m, n] = size(a)
	q = zeros(m, n)
	r = zeros(n, n)
	for k=1:n
		r(k, k) = norm(a(:, k))
		q(:, k) = a(:, k) / r(k, k)
		for j=k+1:n
			r(k, j) = q(:, k)' * a(:, j)
			a(:, j) = a(:, j) - r(k, j) * q(:, k)
		end
	end
endfunction