function basis = basis(U, b)
    n = size(U, 'r')
    z = 1
    basis = []
    freevars = zeros(n, 1)
    for i=1:n
        if U(i, i) == 0 then
            disp(z)
            if size(basis, 'c') <> z then
                basis(:, z) = zeros(n, 1)
            end
            basis(i, z) = z
            freevars(i, 1) = z
            if isequal(U(i, :), zeros(1, n)) == %f then
                z = z + 1
            end 
        end
endfunction