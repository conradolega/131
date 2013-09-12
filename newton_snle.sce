function [x_new, lambda_new] = newton_snle(A, x, lambda)
	x_old = x
	x_new = x
	lambda_old = lambda
	lambda_new = lambda
	f = [A * x_old - lambda_old * x_old; x_old' * x_old]
	j = [A - eye(3, 3) * lambda_old -x_old]
	while norm(x_new, lambda_new) > 0.0001
	sigma = rref(j, f)
	end
endfunction
