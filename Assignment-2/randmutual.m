function F = randmutual( S, C, sigma )
%
% Mutualism Matrix
%

%%Defines upper triangular matrix with zeros
UTmutual = triu(sigma*sigma*randn(S),1);
for j=1:S
    for i=1:j
        random = rand;
        if random>C
            UTmutual(i,j)=0;
        end
    end
end

%% defines lower triangular matrix with for loop for correct sign structure
LT = tril(abs(sigma*sigma*randn(S)),-1);
for j=1:S
    for i=1:j
        if sign(UTmutual(i,j)) == 0
            LT(j,i) = 0;
        else if sign(UTmutual(i,j)) < 0
            LT(j,i) = -1*LT(j,i);
            end
        end
    end
end

%%Diagonal matrix of -1s
D = diag(-1*ones(1,S));

%%adds the matrices together
F = D + UTmutual + LT;
end

