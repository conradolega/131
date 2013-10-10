// source of abscissae and weights:
// http://pomax.github.io/bezierinfo/legendre-gauss.html

abscissae = [
	-0.1834346424956498;
	0.1834346424956498;
	-0.5255324099163290;
	0.5255324099163290;
	-0.7966664774136267;
	0.7966664774136267;
	-0.9602898564975363;
	0.9602898564975363;
]
weights = [
	0.3626837833783620;
	0.3626837833783620;
	0.3137066458778873;
	0.3137066458778873;
	0.2223810344533745;
	0.2223810344533745;
	0.1012285362903763;
	0.1012285362903763;
]

function y = f(x)
	if (x >= -%pi & x <= 0) then y = 1
	elseif (x >= 0 & x <= %pi) then y = %e^(-x)
	end
endfunction

function y = fourier(f, p, n)
	x = -p:0.01:p
	for j = 1:size(x, 'c')
		y(j) = ai(f, p, 0) / 2;
		for i = 1:n
			y(j) = y(j) + ai(f, p, i) * cos((n * %pi * x(j)) / p) + bi(f, p, i) * sin((n * %pi * x(j)) / p);
		end
	end
endfunction

function y = ai(f, p, i)
	y = 0
	for j = 1:8 
		y = y + weights(j) * f(p * abscissae(j)) * cos(i * %pi * abscissae(j));
	end
endfunction

function y = bi(f, p, i)
	y = 0
	for j = 1:8
		y = y + weights(j) * f(p * abscissae(j)) * sin(i * %pi * abscissae(j));
	end
endfunction
