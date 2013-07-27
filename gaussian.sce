function X = gaussian(A)
	X = A
	n = size(X, 'r')
	for col = 1:n
		[v, pos] = max(abs(X), 'r')
		// Switching rows
		temp = X(pos(1), :)
		X(pos(1), :) = X(col, :)
		X(col, :) = temp
		temp = X(:, pos(2))
		X(:, pos(1)) = X(row, :)
		X(row, :) = temp
		if X(col, col) <> 0 then
			X(col, col:$) = X(col, col:$) / X(col, col)
			for row = col+1:n
				X(row, col:$) = X(row, col:$) - (X(row, col) * X(col, col:$))
			end
		end
	end
endfunction