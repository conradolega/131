function X = gaussian(A)
	X = A
	n = size(X, 'r')
	for col = 1:n
		if col <> n then
			Xtemp = X(col:$, col:$)
			[v, pos] = max(abs(Xtemp), 'r')
			temp = Xtemp(pos(1), :)
			Xtemp(pos(1), :) = Xtemp(col, :)
			Xtemp(col, :) = temp
			temp = Xtemp(:, pos(2))
			Xtemp(:, pos(2)) = Xtemp(:, col)
			Xtemp(:, col) = temp
			X(col:$, col:$) = Xtemp
		end
		if X(col, col) <> 0 then
			X(col, col:$) = X(col, col:$) / X(col, col)
			for row = col+1:n
				X(row, col:$) = X(row, col:$) - (X(row, col) * X(col, col:$))
			end
		end
	end
endfunction