// Represent 1900 as 0, 1910 as 1, etc.

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

n = size(population, 'r')

// Interpolation using monomial basis
v = monomial((0:8)', 9)
a = solvelinear(v, population)

// Using cubic spline
s = zeros(n, n)
s(1, 1) = 1
s(n, n) = 1
y = zeros(n, 1)
y(1) = 0
y(n) = 0
for i=2:n-1
    s(i, i-1) = -1
    s(i, i) = -2
    s(i, i+1) = -1
    y(i) = 6 * (population(i) - population(i + 1) - population(i - 1) + population(i))
end

// Using Newton's divided differences
x = (1900:10:1980)'
newton = zeros(n, n)
newton(:, 1) = population
for i=2:n
    for j=i:n
        newton(j, i) = (newton(j, i-1) - newton(i-1, i-1)) / (x(j) - x(i-1))
    end
end