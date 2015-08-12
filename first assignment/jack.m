function F = jack( x )



global B psi0 psi1 k mu c h;

s1=x(1);  v1=x(2);   v2=x(3);   v3=x(4);


%define the variable parameters from the input vector

R = [100*rand(1,7), s1, v1,v2,v3];


[t,y1] = ode45(@elasticity, 0:2000, R);

fixedpoint = y1(end, 1:7);


Js = fixedpoint(1);  Ji = fixedpoint(2);  Us = fixedpoint(3);  Ui = fixedpoint(4);
As =  fixedpoint(5);  Ai = fixedpoint(6);  L =  fixedpoint(7);

row1 = [ -1*(psi1 + s1), 0 ,0, 0, B, B*(1-v1), 0];
row2 = [0, -(psi1 + s1), 0, 0, 0, B*v1, 0];
row3 = [psi0 ,0 , (-1*psi0*exp(-1*c*(As+Ai)) - s1 -(v3*L)/(L+h)), 0, (psi1*Us*c*exp(-1*c*(As+Ai))), (psi1*Us*c*exp(-1*c*(As+Ai))),(v3*As*h)/(L+h)^2];
row4 = [0,psi0, (v3*L)/(L+h)-psi1*exp(-1*c*(As+Ai)),-s1,psi1*Us*c*exp(-1*c*(As+Ai)),psi1*Us*c*exp(-1*c*(As+Ai)),(v3*As*h)/(L+h)^2];
row5 = [0,0,  (psi1*exp(-1*c*(As+Ai))), 0, (-psi1*Us*c*exp(-1*c*(As+Ai)) -(v3*L)/(L+h) -(v2*Ai*Ai)/(As+Ai)^2) ,(-psi1*Us*c*exp(-1*c*(As+Ai)) -s1 -(v2*Ai*Ai)/(As+Ai)^2), ((v3*As*h)/(L+h)^2) ];
row6 = [0,  0, 0,(psi1*exp(-1*c*(As+Ai))),(-psi1*Ui*c*exp(-1*c*(As+Ai))+(v2*Ai*Ai)/(As+Ai)^2 + (v3*L)/(L+h) ),(-psi1*Ui*c*exp(-1*c*(As+Ai))+(v2*Ai*Ai)/(As+Ai)^2 -s1),((v3*As*h)/(L+h)^2)];
row7 = [0,0,0,k,0,k,-1*mu];


%return
F = [row1;row2;row3;row4;row5;row6;row7];
end

