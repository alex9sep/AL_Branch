function [phi_grad_u, phi_grad_v] = create_gradient(phi, u_edge, v_edge, Nx, h)
phi_grad_u = zeros(Nx+1,Nx);
phi_grad_v = zeros(Nx, Nx+1);

% Work with the interior points first
%
for i = 2 : Nx
    for j = 1 : Nx
        phi_grad_u(i, j) = (phi(i, j)- phi(i-1, j))/h;
    end
end

for i = 1 : Nx
    for j = 2:Nx
        phi_grad_v(i, j) = (phi(i, j)- phi(i, j-1))/h;
    end
end


for j = 1 : Nx
    phi_grad_u(1, j) = u_edge(1, j);
    phi_grad_u(Nx+1, j) = u_edge(Nx+1, j);
end


for i = 1 : Nx
    phi_grad_v(i, 1) = v_edge(i, 1);
    phi_grad_v(i, Nx+1) = v_edge(i, Nx+1);
end


