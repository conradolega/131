function [q, r] = gramschmidt(A)
	a = A
	n = size(a, 'c')
	for k=1:n
		r(k, k) = norm(a(:, k))
		q(:, k) = a(:, k) / r(k, k)
		for j=k+1:n
			r(j) = q(:, k)' * a(:, j)
			a(:, j) = a(:, j) - r(j, k) * q(:, k)
		end
	end
endfunction