function y = fourier(f, p, n)
        // evaluate from -%pi:0.1:%pi
        x = -%pi:0.1:%pi
        for j = 1:size(x, 'c')
                y(j) = gl(f, p, 0) / (2 * p)
                for i = 1:n
                        y(j) = y(j) + gl(f, p, i - 1) * cos((n * %pi * x(j)) / p) + gl(
                end
        end
        for i = 1:n
                y = y + gl(f, p, i - 1) * cos(
        end
endfunction

function y = f(x)
        if (x >= -%pi & x <= 0) then y = 1
        elseif (x >= 0 & x <= %pi) then y = %e^(-x)
        end
endfunction

function y = m(flag, x, i)
        if flag == 0 then y = 1
        elseif flag == 1 then y = cos(i * %pi * x)
        elseif flag == 2 then y = sin(i * %pi * x)
        end
endfunction

function y = gl(f, p, flag)
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
        y = 0
        for i=1:8
                y = y + weights(i) * p * f(p * abcissae(i)) * m(flag, abscissae(i), i)
        end
endfunction
