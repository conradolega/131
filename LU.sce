P = perms([n:-1:1])
for p = 1:n!
	A = Aorig(P(p, :), :)
	L = eye(n, n)
	for col = i:n-1
		for row = col+1:n
			alpha = -A(row, col)/A(col, col)
			L(row, col) = -alpha
			A(row, col:$) = A(row, col:$) + alpha * A(col, col:$)
			break
		end`
	end
end
U = A
b = b(P(p, :))
y = zeros(n, 1)
y(1) = b(1)
for i = 2:n
	y(i) = b(i) - L(1:i-1) * y(1:i-1)
end
x = zeros(n, 1)
x(n) = y(n) / A(n, n)
for i = n-1:-1:1
	x(i) = y(i) - U(i, i+1:n) * y(i + 1:n)/U(i, i)