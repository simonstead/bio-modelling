function F = planktonderivs( t,y )
%PLANKTONDERIVS Differential equations for question 1 of assignment 3
%   Takes P and Z as an input, sets up the DEs in order to use fsolve and ODE45.

K= 108;
r = 0.3;
Rm = 0.7;
alpha = 5.7;
mu =0.012;
gamma =0.05;

%% P is for phytoplankton
%% Z is for zooplankton
P =y(1);
Z =y(2);

dPdt = r*P*(1-(P/K)) - (Rm*Z*P*P)/((alpha)^2 + P^2);

dZdt = (gamma*Rm*Z*P*P)/(alpha^2 + P^2) - mu*Z;

F = [dPdt; dZdt];
end

