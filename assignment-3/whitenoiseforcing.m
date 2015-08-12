function F = whitenoiseforcing( t,y )
%DERIVATIVES Summary of this function goes here
%   Detailed explanation goes here

%%variables
K= 108;
Rm = 0.7;
alpha = 5.7;
mu =0.012;
gamma =0.05;
r=0.3;

%% Phytoplankton, zooplankton and amplitude
P =y(1);
Z =y(2);


%% Brownian motion
T = 1; N = 2000; dt = T/N;
dW = zeros(1,N);
W = zeros(1,N);

dW(1) = sqrt(dt)*randn; % 
W(1) = dW(1); % since W(0) = 0 is not allowed

for j = 2:N
dW(j) = sqrt(dt)*randn; 
W(j) = W(j-1) + dW(j);
end

epsilon = 0.1;
epsilon2 = 0.01;


%%Differential equations for the model; equation 2 has white noise forcing added.
dPdt = (r*P*(1 - P/K) - (Rm*Z*P^2 / (alpha^2 + P^2)) )*dt + epsilon2*P*dW(t);

dZdt = (gamma*Rm*Z*P*P)/(alpha^2 + P^2) - mu*Z;

F = [dPdt; dZdt];
end

