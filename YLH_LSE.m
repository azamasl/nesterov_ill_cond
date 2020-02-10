function [f,gx,Hessian,y,r] = YLH_LSE(x,pars)
% from Yuri Nesterov
% nonsmooth problem: F(x)=max(abs(x_1, x_i-2*x_{i-1},i=2,...,n))
%Log-Sum-Exp(aka softmax)
% smoothed version:
% f(x) = softmaxabs(x_1, x_i-2*x_{i-1}, i=2,...,n)
% where 
% softmaxabs(y) = mu log(exp(y_1/mu) + exp(-y_1/mu) + ... + exp(y_n/mu) + exp(-y_n/mu)) 
% where mu is provided by pars.mu

n = length(x);
y = zeros(n,1);
gx = zeros(n,1);
A=eye(n);
for i = 2:n
    A(i,i-1) =-2;
end
y = A*x;
[f,gy,By] = LSE(y,pars.mu);
gx=A'*gy;
Hessian=A'*By*A;
r=rank(Hessian,1e-18);
%[VA,DA,UA]=eig(Hessian);
%d=diag(DA);
%landaMaxA = norm(A)
%landaMaxA = norm(A')
