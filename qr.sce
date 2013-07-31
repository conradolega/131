for k=1:3
	r(k, k) = norm(a(:, k))
	q(:, k) = a(:, k) / r(k, k)
	for j=k+1:3
		r(j, k) = q(:, k)' * a(:, j)
		a(:, j) = a(:, j) - r(j, k) * q(:, k)
	end
end