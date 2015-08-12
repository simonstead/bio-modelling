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
    uniform1=diag(2*rand(1,S));
    M1 = uniform1*randrand(S, C, sigma);
    new1 = eig(M1);
    random_eigs = [random_eigs(); new1 ];
end


mutual_eigs=[];
for i = 1:n
    uniform2=diag(2*rand(1,S));
    M2 = uniform2*randmutual(S, C, sigma);
    new2 = eig(M2);
    mutual_eigs = [mutual_eigs(); new2 ];
end

pred_eigs=[];
for i = 1:n
    uniform3=diag(rand(1,S));
    M3 = uniform3*randpred(S, C, sigma);
    new3 = eig(M3);
    pred_eigs = [pred_eigs(); new3 ];
end


   figure
   
   subplot(2,2,2)
   %   Plot real and imaginary parts of mutualism
     scatter(real(mutual_eigs),imag(mutual_eigs), 10, 'b') 

     xlabel('Real')
     ylabel('Imaginary')
     t1 = ['Competition & Mutualism'];
     title(t1)
     axis([-10 10 -10 10])
     
    subplot(2,2,3)
     %   Plot real and imaginary parts of predator eigenvalues
     scatter(real(pred_eigs),imag(pred_eigs), 10 , 'r')
     xlabel('Real')
     ylabel('Imaginary')
     t2 = ['Predator-Prey'];
     title(t2)
     axis([-10 10 -10 10])
     
     subplot(2,2,1)
     %   Plot real and imaginary parts of predator eigenvalues
     scatter(real(random_eigs),imag(random_eigs), 10 , 'g')
     xlabel('Real')
     ylabel('Imaginary')
     t3 = ['Random'];
     title(t3)
     axis([-10 10 -10 10])


     