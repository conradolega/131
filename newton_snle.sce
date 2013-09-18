function [x_new, lambda_new] = newton_snle(A, x)
	x_new = x
	lambda_new = x' * A * x
	n = 1
	while n >= 0.0001
		x_old = x_new
		lambda_old = lambda_new
		f = [A * x_old - lambda_old * x_old; x_old' * x_old - 1]
		j = [A - eye(3, 3) * lambda_old -x_old; 2 * x_old' 0]
		% Replace this with solvelinear()!
		sigma = j \ f
		soln = [x_old; lambda_old] - sigma
		x_new = soln(1:3)
		lambda_new = soln(4)
		n = norm(sigma)
	end
endfunction
