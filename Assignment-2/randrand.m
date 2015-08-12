function F = randrand( S, C, sigma )
%
% Completely random Matrix
%


%%Definesmatrix with zeros
randommatrix = sigma*sigma*randn(S);
for j=1:S
    for i=1:j
        random = rand;
        if random>C && i~=j
            UTmutual(i,j)=0;
        end
    end
end

%%Diagonal matrix of -1s
D = diag(-1*ones(1,S));

%%adds the matrices together
F = D + randommatrix;
end