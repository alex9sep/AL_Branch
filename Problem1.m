fprintf("Problem 1 will start running.\n") 
u_fun = @(x, y) 1-2*cos(2*pi*x)*sin(2*pi*y);
v_fun = @(x, y) 1+2*sin(2*pi*x)*cos(2*pi*y);


Nx_list = [4, 8, 16, 32, 64, 128];

for Nx = Nx_list
    h = 1/Nx;
    [u_true, v_true] = create_edge(Nx, u_fun, v_fun, 0, 1);
    
    % Perturb our velocity
    %

    u_prime = 2*rand(Nx+1, Nx)-1;
    v_prime = 2*rand(Nx, Nx+1)-1;   

    u = u_true + u_prime;
    v = v_true + v_prime;


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
    
    [grad1, grad2] = create_gradient(phi, u, v, Nx, h);

    u_star = u - grad1;
    v_star = v - grad2;
    err_u = u_star - u_true;
    err_v = v_star - v_true;

    L2_u = norm(h*err_u(:), 2);
    L2_v = norm(h*err_v(:), 2);

    Linf_u = norm(h*err_u(:), "inf");
    Linf_v = norm(h*err_v(:), "inf");




    fprintf("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%\n");
    fprintf("N = ");
    disp(Nx);

    fprintf("Discrete L2 Norm error of our u velocity:\n");
    disp(L2_u);
    fprintf("Discrete L2 Norm error of our v velocity:\n");
    disp(L2_v);

    fprintf("Discrete L infinity Norm error of our u velocity:\n");
    disp(Linf_u);
    fprintf("Discrete L infinity Norm error of our v velocity:\n");
    disp(Linf_v);
    
end
fprintf("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%\n");




