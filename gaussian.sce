function X = gaussian(A)
	X = A
	n = size(X, 'r')
	for col = 1:n
		if col <> n then
			if X(col, col) == 0 then
				v = X(col+1:$, col)
				[m, i] = max(v)
				temp = X(i, :)
				X(i, :) = X(col, :)
				X(col, :) = temp
			end
		end
		if X(col, col) <> 0 then
			X(col, col:$) = X(col, col:$) / X(col, col)
			for row = col+1:n
				X(row, col:$) = X(row, col:$) - (X(row, col) * X(col, col:$))
			end
		end
	end
endfunction