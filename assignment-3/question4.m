%initialize variables
prob = 0.5; 
numberofsteps = 365;
startingat = 0.012;
stepsize = 0.004;
lowerbound = 0.008;
upperbound = 0.032;

W =[prob, numberofsteps, startingat, stepsize, lowerbound, upperbound];

mu1 = randomwalk(W);
mu2 = randomwalk(W); 
mu3 = randomwalk(W); 
mu4 = randomwalk(W);

x = 1:numberofsteps;
hold on
plot(x,mu1, 'g', x, mu2, 'r',x, mu3, 'b', x, mu4, 'm');
title('4 Non-biased Random Walks');
xlabel('Time (days)');
ylabel('Mu(t)');
hold off

