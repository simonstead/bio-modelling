function F = periodicforcing( t,y )
%DERIVATIVES Summary of this function goes here
%   Detailed explanation goes here

%%variables
K= 108;
Rm = 0.7;
alpha = 5.7;
mu =0.012;
gamma =0.05;

%% Phytoplankton, zooplankton and amplitude
P =y(1);
Z =y(2);
A =y(3);

%%equation for periodic forcing
r = 0.3 -1*A*cos(t*2*pi/365);


%%Differential equations for the model
dPdt = r*P*(1-(P/K)) - (Rm*Z*P*P)/((alpha)^2 + P^2);

dZdt = (gamma*Rm*Z*P*P)/(alpha^2 + P^2) - mu*Z;

F = [dPdt; dZdt;0];
end

