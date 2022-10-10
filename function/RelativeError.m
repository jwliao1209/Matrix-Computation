function error = RelativeError(A_new, A_old, type)
if nargin == 2
    type = 'fro';
end
error = norm(A_new - A_old, type) / norm(A_old, type);

end