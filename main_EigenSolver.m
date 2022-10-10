clc; clear;
addpath("function/");

n = 100;
A = rand(n, n);
A = A + A';  % symmetry matrix => all eigenvalues are real number.


%% Solve the largest eigenvalue by Power Method
fprintf('Power Method:\n');

tic;
ew1 = PowerMethod(A);
toc;

error = RelativeError(ew1, eigs(A, 1));
fprintf('Relative error is %e.\n\n', error);


%% Solve the second eigenvalue by Inverse Power Method
fprintf('Inverse Power Method:\n');

ew = sort(eig(A));
a = round(ew(end-1), 1);

tic;
ew2 = InversePowerMethod(A, a);
toc;

error = RelativeError(ew2, min(eigs(A, 2)));
fprintf('Relative error is %e.\n\n', error);


%% Solve eigenvalues by Basic QR
fprintf('Basic QR:\n');

tic;
ew = sort(diag(BasicQR(A)));
toc;

error = RelativeError(ew, sort(eig(A)));
fprintf('Relative error is %e.\n\n', error);


%% Solve eigenvalues by Single Shift QR
fprintf('Single Shift QR:\n');

tic;
ew = sort(diag(SingleShiftQR(A)));
toc;

error = RelativeError(ew, sort(eig(A)));
fprintf('Relative error is %e.\n\n', error);
