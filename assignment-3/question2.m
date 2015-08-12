
t =0:1:364;
y = seasons(2*pi*t/365);
subplot(2,1,1); plot(t,y)

 title('Seasonal Forcing for Plankton Populations');
 xlabel('Time') % x-axis label
 ylabel('Population') % y-axis label
 legend('y = 0.3 -0.1*cos(t)')
 
y2 = seasons2(2*pi*t/365);
subplot(2,1,2); plot(t,y2);


 title('Derivative of the Seasonal Forcing for Plankton Populations');
 xlabel('Time') % x-axis label
 ylabel('Population') % y-axis label
 legend('y = sin(t)/(3-cos(t))')