
%%ODEs to calculate persistence probability for strong and weak obligate
%%mutualism models.

%%set number of iterations
size = 100;

%%set counters
counterweak = 0;
counterstrong = 0;

%%Weak Mutualism
for i=1:size
 
    %perform ODE
[t,y] = ode45(@obligate2dweak, 0:250, rand(1,4));
    %check for extinction
ss2dweak = y(end, 1:4);
if ss2dweak(1) > 0.1
    if ss2dweak(2) > 0.1
        if ss2dweak(3) > 0.1
            if ss2dweak(4) > 0.01
    disp('All Populations Persisted');
    counterstrong = counterstrong + 1;
            end
        end
    end
end


clear t;
clear y;
%taks a long time to calculate, so uncomment this to check program hasn't
%frozen
%i
end

%Strong Mutualism
for i=1:size
    
    %perform ODE
[t,y] = ode45(@obligate2dstrong, 0:250, rand(1,4));

    %check for extinction
ss2dstrong = y(end, 1:4);
if ss2dstrong(1) > 0.1
    if ss2dstrong(2) > 0.1
        if ss2dstrong(3) > 0.1
            if ss2dstrong(4) > 0.01
    disp('All Populations Persisted');
    counterstrong = counterstrong + 1;
            end
        end
    end
end

clear t;
clear y;
%taks a long time to calculate, so uncomment this to check program hasn't
%frozen
%i
end

%%calculate probabilities
persistence_probability_weak = counterweak/size

persistence_probability_weak = counterstrong/size
