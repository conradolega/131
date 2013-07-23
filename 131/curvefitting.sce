x = ones(n, 1)
for i = 1:n
  x(i) = (i - n)/(n - 1)
end

a1 = ones(n, 1)

a2 = ones(n, 1)
for j = 1:n
  a2(i) = (-1)^j
end

a3 = zeros(n, 1)
a3(1) = 1
a3(n) = 1
