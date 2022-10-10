function [A, iter] = BasicQR(A)
tol = 1e-10;
error = Inf;
iter = 0;
maxStep = 10000;

while iter < maxStep && error > tol
    [Q, R] = qr(A);
    A_tmp = R*Q;

    error = RelativeError(A_tmp, A);
    A = A_tmp;
    iter = iter + 1;
end

end
