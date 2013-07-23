h = zeros(n, n)
for i = 1:n
  for j = 1:n
    h(i, j) = 1/(i + j - 1)
  end
end
x = ones(n, 1)
b = H * x
