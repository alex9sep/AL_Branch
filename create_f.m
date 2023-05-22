function f = create_f(u, v, div, Nx, h)

f = div;
% Work with the corners
%
f(1, 1) = div(1, 1) + u(1, 1)/h + v(1, 1)/h;
f(Nx, 1) = div(Nx, 1) -u(Nx+1, 1)/h + v(Nx, 1)/h;

f(1, Nx) = div(1, Nx) + u(1, Nx)/h - v(1, Nx+1)/h;
f(Nx, Nx) = div(Nx, Nx) -u(Nx+1, Nx)/h -v(Nx, Nx+1)/h;

for k = 2 : Nx-1
f(k, 1) = div(k, 1) + v(k, 1)/h;
f(k, Nx) = div(k, Nx) - v(k, Nx+1)/h;
f(1, k) = div(1, k) + u(1, k)/h;
f(Nx, k) = div(Nx, k) - u(Nx+1, k)/h;
end

f = reshape(f, [], 1);






