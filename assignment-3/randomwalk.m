function F = randomwalk(y)
%RANDOMWALKS prob = y(1); numberofsteps = y(2); startingat = y(3); stepsize = y(4); lowerbound = y(5); upperbound = y(6);
%   Detailed explanation goes here

prob = y(1);
numberofsteps = y(2);
startingat = y(3);
stepsize = y(4);
lowerbound = y(5);
upperbound = y(6);

mu = zeros(numberofsteps,1);
mu(1) = startingat;

for i=2:numberofsteps
    p=rand;
    
    if (p<prob)
       if (mu(i-1) ~= lowerbound)
            mu(i) = mu(i-1) - stepsize;
       else
            mu(i) = mu(i-1) + stepsize; 
       end
    end
    
     if (p>=prob)
       if (mu(i-1) ~= upperbound)
            mu(i) = mu(i-1) + stepsize;
       else
            mu(i) = mu(i-1) - stepsize; 
       end
     end
end

F = mu;

end

