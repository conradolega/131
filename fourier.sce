function y = f(x)
        if (x >= -%pi & x <= 0) then y = 1
        elseif (x >= 0 & x <= %pi) then y = %e^(-x)
        end
endfunction
