function [u, v] = create_edge(Nx, u_val, v_val, a, b)
h = (b-a)/Nx;
interval = a : h : b;
midpoint = interval(1:Nx) + h/2;

u = zeros(Nx+1, Nx);
v = zeros(Nx, Nx+1);

for i = 1 : Nx + 1
    for j = 1 : Nx
        x_val = interval(i);
        y_val = midpoint(j);
        u(i, j) = u_val(x_val, y_val);
    end
end

for i = 1 : Nx
    for j = 1 : Nx+1
        x_val = midpoint(i);
        y_val = interval(j);
        v(i, j) = v_val(x_val, y_val);
    end
end


