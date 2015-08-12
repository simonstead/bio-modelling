
numberofrepeats = 20;

hold on
for i=1:numberofrepeats    
[t,y] = ode45(@planktonderivs, 0:365, 10*rand(1,2));
    y(end, 1:2);
    plot(y)
end 

    title('Population Blooms for Phytoplankton and Zooplankton');
    xlabel('Time') % x-axis label
    ylabel('Population') % y-axis label
    legend('y = phytoplanton','y = zooplankton')