clc; clear;
addpath("function/");

n = 1000;
A = rand(n, n);
b = rand(n, 1);

% Direct Method
x = GaussianElimination(A, b);

error = RelativeError(x, A\b);
fprintf('Relative error is %e.\n\n', error);
