c_list = [1, 10^-1, 10^-2, 10^-3, 10^-4, 10^-5, 10^-6, 10^-7];
Nx = 10;

h = 1/Nx;
gam = 2*pi^2;

fprintf("N = ");
disp(Nx);
fprintf("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%\n");
fprintf("Problem 2 will start running.\n") 
fprintf("Nx = ");
disp(Nx);
for c = c_list

    u_fun = @(x, y) gam*(-(y-1)./(2*pi*(x.^2 + (y-1).^2+c)) + ...
            (y+1)./(2*pi*(x.^2 + (y+1).^2+c)));

    v_fun = @(x, y) gam*(x./    (2*pi*(x.^2 + (y-1).^2+c))  + ...
             x   ./(2*pi*(x.^2 + (y+1).^2+c)));

    [u, v] = create_edge(Nx, u_fun, v_fun, -2, 2);
    div_u = mk_div(u, v, h);

    L = create_L(Nx, @lap2d, h);
    f = create_f(u, v, div_u, Nx, h);

    e = ones(1, Nx^2);

    L_append = [L; e];
    e_append = [e, 0];
    L_append = [L_append, e_append'];
    f_append = [f; 0];

    val = L_append \ f_append;
    val = val(1:Nx^2);
    phi = reshape(val, Nx, Nx);


    [u_star, v_star] = create_gradient(phi, u, v, Nx, h);


    new_u = u - u_star;
    new_v = v - v_star;

    div_u = mk_div(new_u, new_v, h);
    fprintf("c = ")
    disp(c);
    fprintf('The max norm of the divergence of my new U\n');
    disp(norm(div_u, 'inf'))
    fprintf("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%\n");
end

