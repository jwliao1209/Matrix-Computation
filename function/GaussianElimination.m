function x = GaussianElimination(A, b)
x = zeros(size(b));

for i=1:length(b)-1
    for j=i:length(b)-1
        b(j+1) = b(j+1) - A(j+1, i) * b(i) / A(i,i);
        tmp = A(j+1, i) * A(i, i:end) / A(i,i);
        A(j+1, i:end) = A(j+1, i:end) - tmp;
    end
end

% Backward Subsitution
x(end) = b(end) / A(end, end);
for i=1:length(b)-1
    tmp = A(end-i, end+1-i:end) * x(end+1-i:end);
    x(end-i) = (b(end-i) - tmp) / A(end-i, end-i);
end

end
