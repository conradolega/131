function m = getminor(x, i, j)
	n = size(x, 'r')
	m = [x(1:i-1, 1:j-1), x(1:i-1, j+1:n); x(i+1:n, 1:j-1), x(i+1:n, j+1:n)]
endfunction
 
function y = determinant(x)
	c = size(x, 'c')
	r = size(x, 'r')
	y = 0
	if c == r then
		if c == 2 then
			y = x(1, 1) * x(2, 2) - x(2, 1) * x(1, 2)
	  	else
	  		for i = 1:c
				minor = getminor(x, i, 1)
  				y = y + (-1)^(i + 1) * x(i, 1) * determinant(minor)
	  		end
	  	end
	else
        error('Matrix is not square')
	end
endfunction	