function [EW, EV, iter] = InversePowerMethod(A, a)
[m, ~] = size(A);
B = A - a * eye(m);
[L, U] = lu(B);

u = rand(m, 1);
maxStep = 10000;
error = Inf;
tol = 1e-10;
iter = 0;
Lf =@ (x) ones(1, m) * x;

while iter < maxStep && error > tol
    % v = B^(-1)*u => Bv = u;
    y = L \ u;
    v = U \ y;
    k = Lf(v);
    u_tmp = v / k;

    error = RelativeError(u_tmp, u, 2);
    u = u_tmp;
    iter = iter + 1;
end
EW = a + 1 / k;
EV = u / norm(u);

end
