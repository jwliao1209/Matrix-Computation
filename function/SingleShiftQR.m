function [H, iter] = SingleShiftQR(A)
[m, ~] = size(A);
H = hess(A);  % H = Q'*A*Q
u = H(m, m);
uI = u * eye(m);
tol = 1e-6;
error = Inf;
iter = 0;
maxStep = 1000000;

while iter < maxStep && error > tol
    [Q, R] = qr(H - uI);
    H_tmp = R*Q + uI;

    error = RelativeError(H_tmp, H);
    H = H_tmp;
    iter = iter + 1;
end

end
