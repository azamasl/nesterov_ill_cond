function [fB,dnormB,iterB,fLB1scale,dnormLB1scale,iterLB1scale,fLB1noscale,dnormLB1noscale,iterLB1noscale, muvalues]= LMruns_YLH_LSE(n,startpert,maxit)
addpath('/Users/azam/google/projects/mCode/mlibs/hanso2_2')

muvalues = 10.^(-16:0) % this is OK for n=10, for bigger n, takes too long
for k=1:length(muvalues) % 2018: using only LBFGS-1
    mu = muvalues(k) 

    [pars,options] = pars_YLH_LSE(n,startpert,inf,mu);
    options.maxit = maxit;
    options.nvec = 0;
    options.scale = 1;
    [x,f,d,H,iter,info] = bfgs(pars,options);       
    fB(k) = f;
    dnormB(k) = norm(d);
    iterB(k) = iter;    
    options.nvec = 1; % limited memory option: LBFGS-1
    options.scale = 1; 
    [x,f,d,H,iter,info] = bfgs(pars,options);    
    fLB1scale(k) = f;
    dnormLB1scale(k) = norm(d);
    iterLB1scale(k) = iter;
    options.nvec = 1;
    options.scale = 0;    
    [x,f,d,H,iter,info] = bfgs(pars,options);    
    fLB1noscale(k) = f;
    dnormLB1noscale(k) = norm(d);
    iterLB1noscale(k) = iter;
end
 