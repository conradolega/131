function basis = basis(A)
    n = size(A, 'r')
    basis = []
    for i=n:-1:1
        if A(i, i) == 0 then
            for j=i-1:-1:1
                if A(j, i) <> 0 & isequal(A(j, 1:i-1), zeros(1, n-j+1)) then
                    A([j, i], :) = A([i, j], :)
                end
            end
        end
    end
    for i=1:n
        if A(i, i) == 0 then
            basis = [basis -1 * A(:, i)]
            basis(i, size(basis, 'c')) = 1
        end
    end
endfunction