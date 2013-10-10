function y = f(x)
        if (x >= -%pi & x <= 0) then y = 1
        elseif (x >= 0 & x <= %pi) then y = %e^(-x)
        end
endfunction

function y = gl(f, p)
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
                y = y + weights(i) * p * f(p * abcissae(i))
        end
endfunction
