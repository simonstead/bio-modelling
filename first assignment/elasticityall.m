    %%%                                             %%%
    % Elasticity Values of leptospirosis prevalence   %
    %%%                                             %%%
    
    for i=1:4
        
    %Define 2 identical vectors vector: [7 random digits, s1  ,v1,  v2, v3]
    Random2 = [100*rand(1,7), 0.013, 0.01, 0.01, 0.005];
    Random1 = [100*rand(1,7), 0.013, 0.01, 0.01, 0.005];
    
    %This scales up the individual variable s1, v1, v2 or v3 by 10%
    %depending on which iteration of the loop is being run.
    Random2(i+7)= 1.1*Random2(i+7);
    
    %integrate two ODEs through time, allowing enough iterations to
    %converge suitably. One is for the scaled up version, one is for the
    %original value.
    [t,y2] = ode45(@elasticity, 0:2000, Random2);
    [t,y1] = ode45(@elasticity, 0:2000, Random1);
    
    %Obtain the end row of the ODE matrix so we can compare the fixed
    %points.
    end2=y2(end, 1:7);
    end1=y1(end, 1:7);
    
    %Calculating prevalence of leptospirosis (the sum of all infected rodents)
    P2 = end2(2)+end2(4)+end2(6);
    P1 = end1(2)+end1(4)+end1(6);
    
    
    %Elasticity calculation for prevalence of leptospirosis.
    elasticityprevalence(i) = 10*(P2-P1)/P1;
    
    end
    
    
    
    %%%                                             %%%
    % Elasticity Values of total rodent population    %
    %%%                                             %%%
    
    for i=1:4
    %Define 2 identical vectors vector: [7 random digits, s1  ,v1,  v2, v3]
    Random2 = [100*rand(1,7), 0.013, 0.01, 0.01, 0.005];
    Random1 = [100*rand(1,7), 0.013, 0.01, 0.01, 0.005];
    
    %This scales up the individual variable s1, v1, v2 or v3 by 10%
    %depending on which iteration of the loop is being run.
    Random2(i+7)= 1.1*Random2(i+7);
    
    %integrate two ODEs through time, allowing enough iterations to
    %converge suitably. One is for the scaled up version, one is for the
    %original value.
    [t,y2] = ode45(@elasticity, 0:2000, Random2);
    [t,y1] = ode45(@elasticity, 0:2000, Random1);
    
    %Obtain the end row of the ODE matrix so we can compare the fixed
    %points.
    end2=y2(end, 1:7);
    end1=y1(end, 1:7);
    
    
    %Calculating total rodent population. We sum all values pertaining to
    %number of rodents (all but the environmental leptospires).
    T2 = end2(1)+end2(2)+end2(3)+end2(4)+end2(5)+end2(6);
    T1 = end1(1)+end1(2)+end1(3)+end1(4)+end1(5)+end1(6);
    
    %elasticity calculation for total rodent population
    elasticitytotal(i) = 10*(T2-T1)/T1;
    
    end
    
    
    
    
    %%%                                                     %%%
    %  Elasticity Values of total environmental leptospires   %
    %%%                                                     %%%
    
    for i=1:4
    %Define 2 identical vectors vector: [7 random digits, s1  ,v1,  v2, v3]
    Random2 = [100*rand(1,7), 0.013, 0.01, 0.01, 0.005];
    Random1 = [100*rand(1,7), 0.013, 0.01, 0.01, 0.005];
    
     %This scales up the individual variable s1, v1, v2 or v3 by 10%
    %depending on which iteration of the loop is being run.
    Random2(i+7)= 1.1*Random2(i+7);
    
    
    %integrate two ODEs through time, allowing enough iterations to
    %converge suitably. One is for the scaled up version, one is for the
    %original value.
    [t,y2] = ode45(@elasticity, 0:2000, Random2);
    [t,y1] = ode45(@elasticity, 0:2000, Random1);
    
    %Obtain the end row of the ODE matrix so we can compare the fixed
    %points.
    end2=y2(end, 1:7);
    end1=y1(end, 1:7);
    
    %Total number of leptospires in the environment
    L2 = end2(7);
    L1 = end1(7);
    
    %elasticity calculation for environmental leptospores
    elasticityenviron(i) = 10*(L2-L1)/L1;
    
    end

        
    %%% Define a blank vector, and add each of the return vectors above to
%     %%% it, so we can input this data into a bar chart.
%     elasticityvector = [];
%     for i=1:4
%     elasticityvector = [elasticityvector, elasticityenviron(i), elasticitytotal(i), elasticityprevalence(i);]
%     end
%     

    
   
    %%% Draw a bar chart for our elasticity data, with legend, axis labels
    %%% and colours.
    elasticitymatrix = [elasticityenviron; elasticitytotal; elasticityprevalence;];
    bar(elasticitymatrix)
    title('Elasticity values for different paramaters')
    legend('S1','V1','V2','V3', 'Location', 'Southeast')
    str = {'Environmental Leptosires'; 'Total Rodent Population'; 'Prevalence of Leptospirosis'};
    set(gca, 'XTickLabel',str, 'XTick',1:numel(str))

  
    
    