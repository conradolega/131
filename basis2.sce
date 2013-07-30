function basis = basis(U, b)
	n = size(U, 'r')
	z = 1
	basis = []
	freevars = zeros(n, 1)
	for i = n:-1:1
		disp(z)
		if U(i, i) == 0 then
			if isequal(U(i, :), zeros(1, n)) == %t then
				// Don't update z
				freevars(i) = z
				basis(i, z) = 1
			else
				z = z + 1
				freevars(i) = z
				basis(i, z) = 1
				for j = i+1:n
					basis(i, freevars(j)) = basis(i, freevars(j)) + U(i, j) * basis(j, freevars(j))
				end
			end
		else
			for j = i+1:n
				disp('i:')
				disp(i)
				disp('j: ')
				disp(j)
				disp(freevars)
				disp(basis)
				// if freevars(j) <> 0 then
				basis(i, freevars(j)) = basis(i, freevars(j)) + U(i, j) * basis(j, freevars(j))
				// else
				// Get from somewhere else
			end
		end
	end
endfunction