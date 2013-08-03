function X = gaussianfull(A)
	X = A
	n = size(X, 'r')
	for col = 1:n
		if col <> n then
			[v, pos] = max(abs(X(col:$, col:n)))
			X([col, pos(1)+col-1], :) = X([pos(1)+col-1, col], :)
			X(:, [col, pos(2)+col-1]) = X(:, [pos(2)+col-1, col])
		end
		if X(col, col) <> 0 then
			X(col, col:$) = X(col, col:$) / X(col, col)
			for row = col+1:n
				X(row, col:$) = X(row, col:$) - (X(row, col) * X(col, col:$))
			end
		end
		X = clean(X)
	end
endfunction

function X = gaussianpartial(A)
	X = A
	n = size(X, 'r')
	for col = 1:n
		if col <> n then
			[v, pos] = max(abs(X(col:$, col:n)), 'r')
			X([col, pos(1)+col-1], :) = X([pos(1)+col-1, col], :)
		end
		if X(col, col) <> 0 then
			X(col, col:$) = X(col, col:$) / X(col, col)
			for row = col+1:n
				X(row, col:$) = X(row, col:$) - (X(row, col) * X(col, col:$))
			end
		end
		X = clean(X)
	end
endfunction