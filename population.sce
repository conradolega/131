population = [
    76212168;
    92228496;
    106021537;
    123202624;
    132164569;
    151325798;
    179323175;
    203302031;
    226542199
]

function [a, s, y, an, v] = probset4(population)
    n = size(population, 'r')
    v = monomial((0:8)', n)
    a = solvelinear(v, population)

    s = zeros(n, n)
    s(1, 1) = 1
    s(n, n) = 1
    y = zeros(n, 1)
    y(1) = 0
    y(n) = 0
    for i=2:n-1
        s(i, i-1) = -10
        s(i, i) = -20
        s(i, i+1) = -10
        y(i) = 6 * ((population(i) - population(i + 1))/10 - (population(i - 1) + population(i))/10)
    end

    x = (0:8)'
    newton = zeros(n, n)
    newton(:, 1) = population
    for i=2:n
        for j=i:n
            newton(j, i) = (newton(j, i-1) - newton(i-1, i-1)) / (x(j) - x(i-1))
        end
    end
    an = diag(newton)
endfunction

function y = newton_eval(a, x, xi)
    y = a(1)
    n = size(a, 'r')
    for i=2:n
        p = a(i)
        for j=2:i
            p = p * (x - xi(j-1))  
        end
        y = y + p
    end
endfunction