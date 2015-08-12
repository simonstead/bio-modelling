    
    %%Aplitude = A
    %%We'll loop through values of A, incrementing to find the minimum
    %%amplitude to cause a 'bloom' (over 50 ugNl^_1)

    
    %%% calculate the steadystate from question 1
    [t,y] = ode45(@planktonderivs, 0:2000, rand(1,2));
    steadystate = y(end, 1:2);

    %amplitude at which we see regular blooms
    finalamp = 0.1067;
    
    [t,y_under] = ode45(@periodicforcing, 0:1000, [steadystate, finalamp-0.001]);
    [t,y_exact]= ode45(@periodicforcing, [0:1000], [4.1172,4.9502, finalamp]);
    [t,y_over] = ode45(@periodicforcing, 0:1000, [steadystate, finalamp + 0.001]);
    
    
    subplot(3,1,1); plot(t,y_under)
     title('Seasonal Forcing for Plankton Populations');
     xlabel('Time') % x-axis label
     ylabel('Population') % y-axis label

    subplot(3,1,2); plot(t,y_exact)
     xlabel('Time') % x-axis label
     ylabel('Population') % y-axis label
     legend('y = phytoplanton','y = zooplankton')
    
    subplot(3,1,3); plot(t,y_over)
     xlabel('Time') % x-axis label
     ylabel('Population') % y-axis label

    