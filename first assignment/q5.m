
%%%% Input a 4-vector of s1,v1,v2,v3 and compute the elasticities using the
%%%% real part of the eigenvalues of the jacobian matrix.


global B psi0 psi1 s0 k mu c h;

%define input vector for each parameter (original, then 10% scaled)
param = [0.013, 0.01 , 0.01 , 0.005];
params1 = [0.013*1.1, 0.01 , 0.01 , 0.005];
paramv1 = [0.013, 0.01*1.1 , 0.01 , 0.005];
paramv2 = [0.013, 0.01 , 0.01*1.1 , 0.005];
paramv3 = [0.013, 0.01 , 0.01 , 0.005*1.1];

%compute the jacobian matrix for each given vector, evaluated at the fixed
%point
J   = jack(param);
Js1 = jack(params1);
Jv1 = jack(paramv1);
Jv2 = jack(paramv2);
Jv3 = jack(paramv3);

%find eigenvalues of our jacobian
eigenvalues=eig(J);
eigenvaluess1=eig(Js1);
eigenvaluesv1=eig(Jv1);
eigenvaluesv2=eig(Jv2);
eigenvaluesv3=eig(Jv3);

%take the real part of our eigenvalues only
realpart=real(eigenvalues);
realparts1=real(eigenvaluess1);
realpartv1=real(eigenvaluesv1);
realpartv2=real(eigenvaluesv2);
realpartv3=real(eigenvaluesv3);

%loops through each eigenvalue, tests if it is closer to zero than the
%last. If it is, it replaces the value of smallesteigenvalue with that
%value.

smallesteigenvalue = 100;
for i=1:7
    if abs(realpart(i)) < abs(smallesteigenvalue)
    smallesteigenvalue = realpart(i);
    end
end

smallesteigenvalues1 = 100;
for i=1:7
    if abs(realparts1(i)) < abs(smallesteigenvalues1)
    smallesteigenvalues1 = realparts1(i);  
    end
end

smallesteigenvaluev1 = 100;
for i=1:7
    if abs(realpartv1(i)) < abs(smallesteigenvaluev1)
    smallesteigenvaluev1 = realpartv1(i);    
    end
end

smallesteigenvaluev2 = 100;
for i=1:7
    if abs(realpartv2(i)) < abs(smallesteigenvaluev2)
    smallesteigenvaluev2 = realpartv2(i);    
    end
end

smallesteigenvaluev3 = 100;
for i=1:7
    if abs(realpartv3(i)) < abs(smallesteigenvaluev3)
    smallesteigenvaluev3 = realpartv3(i);    
    end
end


%calculate elasticity for each of the paramaters
elasticitys1 = 10*(smallesteigenvalues1 - smallesteigenvalue)/smallesteigenvalue;
elasticityv1 = 10*(smallesteigenvaluev1 - smallesteigenvalue)/smallesteigenvalue;
elasticityv2 = 10*(smallesteigenvaluev2 - smallesteigenvalue)/smallesteigenvalue;
elasticityv3 = 10*(smallesteigenvaluev3 - smallesteigenvalue)/smallesteigenvalue;

elasticity = [elasticitys1;elasticityv1;elasticityv2;elasticityv3]
bar(elasticity)
title('Elasticity values for different paramaters, using the Jacobian matrix')
    str = {'s1'; 'v1'; 'v2'; 'v3'};
    set(gca, 'XTickLabel',str, 'XTick',1:numel(str))
