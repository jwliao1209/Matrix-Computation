function [EW, EV, iter] = PowerMethod(A)
[m, ~] = size(A);
u = rand(m, 1);
maxStep = 10000;
error = Inf;
tol = 1e-10;
iter = 0;
L =@ (x) ones(1, m) * x;

while iter < maxStep && error > tol
    v = A * u;
    k = L(v);
    u_tmp = v / k;

    error = RelativeError(u_tmp, u, 2);
    u = u_tmp;
    iter = iter + 1;
end
EW = k;
EV = u / norm(u);

end