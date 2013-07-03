function X = gaussian(A)
	X = A
	n = size(X, 'r')
	for col = 1:n
		if X(col, col) == 0 then
			v = X(col+1:$, col)
			[m, i] = max(v)
			temp = X(i, :)
			X(i, :) = X(col, :)
			X(col, :) = temp
		end
		X(col, col:$) = X(col, col:$) / X(col, col)
		for row = col+1:n
			X(row, col:$) = X(row, col:$) - (X(row, col) * X(col, col:$))
		end
	end
endfunction	

x = zeros(n, 1)
x(n) = A(n, n+1)

for i = n-1:-1:1
	x(i) = A(i, $) - A(i, i+1:n) * x(i+1:n)
end

for col = n:-1:2
	for row = col-1:-1:1
		A(row, row:$) = A(row, row:$) - A(row, col) * A(col, row:$)
	end
end

x = A(:,$)