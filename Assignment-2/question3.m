%%% ODEs to calculate whether the differential equations in obligate1dweak
%%% and obligate1dstrong cause the plant and animal populations to become
%%% extinct. 
%% NOTE WHEN RUNNING. Sometimes ODE will throw a warning "Unable to meet integration tolerance"
%% This will not affect program execution, so please allow program to continue

%%set iteration length
size = 500;

%%Define counters
counterweak = 0;
counterstrong = 0;

%%Weak Mutualism
for i=1:size
[t,y] = ode45(@obligate1dweak, 0:250, rand(1,2));
ss1dweak = y(end, 1:2);

%% Extinction Check for Weak Mutualism
if ss1dweak(1) < 0.01
    if ss1dweak(2) < 0.01   
        counterweak = counterweak + 1;
    end
end

clear t;
clear y;

end


%% Strong Mutualism
for i=1:size
[t,y] = ode45(@obligate1dstrong, 0:250, rand(1,2));
ss1dstrong = y(end, 1:2);

%%Extinction Check for Strong Mutualism
if ss1dstrong(1) < 0.01
    if ss1dstrong(2) < 0.01   
        counterstrong=counterstrong + 1;
    end
end

clear t;
clear y;
end

% % %Checking extinction probability
extinction_probability_weak = counterweak/size
extinction_probability_strong = counterstrong/size


