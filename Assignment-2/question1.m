%size of matrix
S = 250;
%probability
C = 0.25;
%standard dev
sigma = 1;

%number of loops
n=1;

random_eigs=[];
for i = 1:n
    new = eig(randrand(S, C, sigma));
    random_eigs = [random_eigs(); new ];
end


mutual_eigs=[];
for i = 1:n
    newm = eig(randmutual(S, C, sigma));
    mutual_eigs = [mutual_eigs(); newm ];
end

pred_eigs=[];
for i = 1:n
    newp = eig(randpred(S, C, sigma));
    pred_eigs = [pred_eigs(); newp ];
end


   figure
   
   subplot(2,2,2)
   %   Plot real and imaginary parts of mutualism
     scatter(real(mutual_eigs),imag(mutual_eigs), 10, 'b') 

     xlabel('Real')
     ylabel('Imaginary')
     t1 = ['Competition & Mutualism'];
     title(t1)
     axis([-20 20 -20 20])
     
    subplot(2,2,3)
     %   Plot real and imaginary parts of predator eigenvalues
     scatter(real(pred_eigs),imag(pred_eigs), 10 , 'r')
     xlabel('Real')
     ylabel('Imaginary')
     t2 = ['Predator-Prey'];
     title(t2)
     axis([-20 20 -20 20])
     
     subplot(2,2,1)
     %   Plot real and imaginary parts of predator eigenvalues
     scatter(real(random_eigs),imag(random_eigs), 10 , 'g')
     xlabel('Real')
     ylabel('Imaginary')
     t3 = ['Random'];
     title(t3)
     axis([-20 20 -20 20])


     