function F = randomwalkforcing(t,y)


%DERIVATIVES Summary of this function goes here
%   Detailed explanation goes here
global RWmu;

K= 108;
r = 0.3;
Rm = 0.7;
alpha = 5.7;
gamma =0.05;

%% P is for phytoplankton
%% Z is for zooplankton
P =y(1);
Z =y(2);





%%Differential equations for the system
dPdt = r*P*(1-(P/K)) - (Rm*Z*P*P)/((alpha)^2 + P^2);

dZdt = (gamma*Rm*Z*P*P)/(alpha^2 + P^2) - RWmu(t)*Z;


F = [dPdt; dZdt];
end

