function F = obligate1dstrong(t,y)


alpha_a = 0.4*rand - 0.3;
alpha_p = 0.199*rand - 0.2;
beta_a = rand + 1;
beta_p = rand + 1;
gamma_w = 0.1*rand + 0.2;
gamma_s = rand + 2;
h = 0.9*rand + 0.1;


Np = y(1);
Na = y(2);

dNpdt = Np*alpha_p - beta_p*(Np)^2 + (Np*gamma_s*Na*h)/(1 + h*Na);

dNadt = Np*alpha_a - beta_a*(Na)^2 + (Na*gamma_s*Np*h)/(1 + h*Np);

F = [dNpdt; dNadt];

end
