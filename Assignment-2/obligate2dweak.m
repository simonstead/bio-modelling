function F = obligate2dweak(t,y)
%input vector as p1, p2, a1, a2

alpha_a = 0.4*rand(2) - 0.3;

alpha_p = 0.199*rand(2) - 0.2;

beta_a = rand(2) + 1;

beta_p = rand(2) + 1;

gamma_w = 0.1*rand(2,2) + 0.2;

gamma_s = rand(2,2) + 2;

h = 0.9*rand(2,2) + 0.1;


Np1 = y(1);
Np2 = y(2);
Na1 = y(3);
Na2 = y(4);


dNp1dt = Np1*(alpha_p(1) - beta_p(1)*Np1 + (gamma_w(1,1)*h(1,1)*Na1)/(1 + h(1,1)*(Na1 + Na2)) + (gamma_w(1,2)*h(1,2)*Na2)/(1 + h(1,2)*(Na1 + Na2)));

dNp2dt = Np2*(alpha_p(2) - beta_p(2)*Np2 + (gamma_w(2,1)*h(2,1)*Na1)/(1 + h(2,1)*(Na1 + Na2)) + (gamma_w(2,2)*h(2,2)*Na2)/(1 + h(2,2)*(Na1 + Na2)));

dNa1dt = Np1*(alpha_a(1) - beta_a(1)*Np1 + (gamma_w(1,1)*h(1,1)*Na1)/(1 + h(1,1)*(Na1 + Na2)) + (gamma_w(1,2)*h(1,2)*Na2)/(1 + h(1,2)*(Na1 + Na2)));

dNa2dt = Np2*(alpha_a(2) - beta_a(2)*Np2 + (gamma_w(2,1)*h(2,1)*Na1)/(1 + h(2,1)*(Na1 + Na2)) + (gamma_w(2,2)*h(2,2)*Na2)/(1 + h(2,2)*(Na1 + Na2)));


F = [ dNp1dt; dNp2dt; dNa1dt; dNa2dt ];

end
