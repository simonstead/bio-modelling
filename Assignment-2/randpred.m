function F = randpred( S, C, sigma  )
%RANDPRED Summary of this function goes here
%   Detailed explanation goes here


%%Defines upper triangular matrix with zeros
UTpred = triu(sigma*sigma*randn(S),1);
for j=1:S
    for i=1:j
        random = rand;
        if random>C
            UTpred(i,j)=0;
        end
    end
end


%% defines lower triangular matrix with for loop for correct sign structure
LTpred = tril(abs(sigma*sigma*randn(S)),-1);
for j=1:S
    for i=1:j
        if sign(UTpred(i,j)) == 0
            LTpred(j,i) = 0;
        else if sign(UTpred(i,j)) > 0
            LTpred(j,i) = -1*LTpred(j,i);
            end
        end
    end
end

%%Diagonal matrix of -1s
D = diag(-1*ones(1,S));

%%adds matrices together and returns
F = D + LTpred + UTpred;

end

