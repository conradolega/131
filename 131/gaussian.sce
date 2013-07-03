n = size(A, 'r')
for col = 1:n
	if A(col, col) == 0 then
		v = A(col+1:$, col)
		[m, i] = max(v)
		temp = A(i, :)
		A(i, :) = A(col, :)
		A(col, :) = temp
	end
	A(col, col:$) = A(col, col:$) / A(col, col)
	for row = col+1:n
		A(row, col:$) = A(row, col:$) - (A(row, col) * A(col, col:$))
	end
end

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