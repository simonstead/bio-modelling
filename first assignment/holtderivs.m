function F = holtderivs(x)

%define all constants as global variables
global B psi0 psi1 v1 v2 v3 s0 s1 k mu c h;

%specify values of constants
B=0.12;    psi0=0.04; psi1=0.01; v1=0.01;   v2=0.01;   v3=0.005;   s0=0.01;
s1=0.013;   k=1000;    mu=0.1;   c=0.04;    h=1000000; 

%relabel input vector
Js = x(1);  Ji = x(2);  Us = x(3);  Ui = x(4);
As = x(5);  Ai = x(6);  L = x(7);

%coupled differential equations
dJsdt = B*(As + (1 - v1)*Ai) - psi0*Js - s0*Js;

dJidt = B*v1*Ai - psi0*Ji - s0*Ji;

dUsdt = psi0*Js - psi1*exp(-1*c*(As + Ai))*Us - s1*Us - (v3*L*Us)/(L+h);

dUidt = psi0*Ji +(v3*L*Us)/(L+h) -psi1*exp(-1*c*(As + Ai))*Ui - s1*Ui;

dAsdt = psi1*exp(-1*c*(As + Ai))*Us - s1*As - (v2*As*Ai)/(Ai + As) - (v3*L*As)/(L + h);

dAidt = psi1*exp(-1*c*(As + Ai))*Ui + (v2*As*Ai)/(Ai+ As) + (v3*L*As)/(L + h) - s1*Ai;

dLdt = k*(Ui + Ai) - mu*L;

%return
F = [dJsdt, dJidt, dUsdt, dUidt,dAsdt,dAidt, dLdt ];


end



