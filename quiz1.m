T = 1;
f = 1/T;
n_terms = 10;
a_n = zeros(1,n_terms*2);

for n = 1:2:n_terms*2
    f1 = @(t) (4*t - 1).*cos(2*pi*n*t/T);
    f2 = @(t) (-4*t + 3).*cos(2*pi*n*t/T);
    
    integral_tot = integral(f1, 0, 0.5) + integral(f2, 0.5, 1);
    
    if (n > 0)
        a_n(n) = 2 * integral_tot;
    end
end