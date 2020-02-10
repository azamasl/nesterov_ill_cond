function [f,g,B,r] = LSE2(y,landa)

MAXy = max(max(y), max(-y)); 
ytlan = landa*y;%;
mytlan = -ytlan;%;[y;-y];
ey=exp(y-MAXy)
emy=exp(-y-MAXy)
V1=power(ey,landa)%e^landa*y
V2=power(emy,landa)%e^-landa*y; % more acurate imp of e^z when z is very small
s = sum(V1+V2)
%sm1=s-1;
f = MAXy+ (log(s))/landa%more acurrate imp of log(s)
V1=V1./s;
V2=V2./s;
g =V1-V2 
W =V1+V2

B = landa*(diag(W)-g*g');

r=rank(B,1e-18);