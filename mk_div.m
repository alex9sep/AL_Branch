function phi = mk_div(u, v, h)
[temp1, temp2] = size(u);
Nx= min(temp1, temp2);

phi = zeros(Nx, Nx);

for i = 1 : Nx
    for j = 1 : Nx

        u_direc = (u(i+1, j) - u(i, j))/h;
        v_direc = (v(i, j+1) - v(i, j))/h;
        phi(i, j) = u_direc + v_direc;
    end
end


