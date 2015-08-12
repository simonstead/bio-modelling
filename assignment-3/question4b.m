
%%%%
%% Random Walk
%%%%
clear all;

%initialize variables
prob = 0.5; 
global numberofsteps
numberofsteps = 365;
startingat = 0.012;
stepsize = 0.004;
lowerbound = 0.008;
upperbound = 0.032;

W =[prob, numberofsteps, startingat, stepsize, lowerbound, upperbound];
global RWmu;
RWmu = randomwalk(W);
init = zeros(2,1);
init(1) = 4.1173;
init(2) = 4.9503;


timestep = 1;
tmax = numberofsteps;
timelength = int64(tmax/timestep); % the number of time step we will need


timevec = 1:timelength;  % vector for times

xmat = zeros(2,timelength);     % matrix for populations at corresponding times
xmat(:,1)=init;


for i=2:timelength
    xmat(:,i) = xmat(:,i-1) + timestep.*randomwalkforcing(1,xmat(:,i-1));  % the Euler step
    xmat(1,i) = xmat(1,i) + xmat(1,i)*sqrt(timestep)*RWmu(i);

end

plot(1:timelength,xmat)
   title('Random Walk Forcing for Plankton Population');
     xlabel('Time') % x-axis label
     ylabel('Population') % y-axis label
     legend('y = phytoplanton','y = zooplankton')


