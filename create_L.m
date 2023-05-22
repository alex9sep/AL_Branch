function L = create_L(Nx, lap2d, h)
L = lap2d(Nx, Nx);

% Work with the corners
%
L(1, 1) = -2;
L(Nx, Nx) = -2;
L(Nx^2-Nx+1, Nx^2-Nx+1) = -2;
L(Nx^2, Nx^2) = -2;

% Sides between the corners
%

for k = 2 : Nx - 1
    L(k, k) = -3;
    L(Nx^2-Nx+k, Nx^2-Nx+k) = -3;
    L((k-1)*Nx+1, (k-1)*Nx+1) = -3;
    L(k*Nx, k*Nx) = -3;
end

L = L/h^2;
