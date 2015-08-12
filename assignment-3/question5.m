
%%variables
K= 108;
Rm = 0.7;
alpha = 5.7;
mu =0.012;
gamma =0.05;
r=0.3;
epsilon=0.1;

timestep = 1;
tmax = 365;
timelength = int64(tmax/timestep); % the number of time step we will need

initial = [4.11,4.095]'; % initial condition
timevec = 1:timelength;  % vector for times

xmat = zeros(2,timelength);     % matrix for populations at corresponding times
xmat(:,1)=initial;


for i=2:timelength
    xmat(:,i) = xmat(:,i-1) + timestep.*whitenoiseforcing(1,xmat(:,i-1));  % the Euler step
    xmat(1,i) = xmat(1,i) + xmat(1,i)*epsilon*sqrt(timestep)*randn;
     if xmat(1:i)<0;
xmat(1:i)=0;
break
end
end






hold on
plot(double(timevec)*timestep,xmat(1,:),'b');
plot(double(timevec)*timestep,xmat(2,:),'r');
plot(xmat);
     title('White Noise Forcing for Plankton Populations (epsilon = 0.1)');
     xlabel('Time') % x-axis label
     ylabel('Population') % y-axis label
     legend('y = phytoplanton','y = zooplankton')
