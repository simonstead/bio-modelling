%call global variables
global B psi0 psi1 v1 v2 v3 s0 s1 k mu c h;

%define a 7-vector of random positive numbers, scaled up by a factor of
%100.
R=100*rand(1,7)

%solve our holtdervs coupled ODEs with the random starting values above
eqn = fsolve(@holtderivs, R)



