function [pars,options] = pars_YLH_LSE(n, startpert, fvalquit, mu);
pars.fgname = 'YLH_LSE';
pars.mu = mu;
pars.nvar = n;
pars.xexact = zeros(n,1);
pars.title = sprintf('AZAMs Log-Sum-Exp for Smoothed Yuri Les Houches , n=%d, smoothing=%g',n,mu);
pars.optval = mu*log(2*n);
pars.optx = zeros(n,1);
[optf,optg,opthess] = YLH_LSE(zeros(n,1),pars);
if norm(optf - pars.optval) > 1e-12 || norm(optg) > 1e-12
    keyboard
end
pars.opthess = opthess;
if nargout > 1
    options.x0 = ones(n,1) + startpert*randn(n,1);
    options.normtol = 1e-100;
    options.evaldist = 1e-100;
    options.prtlevel = 1;
    if fvalquit < inf
        options.fvalquit = fvalquit;
        options.maxit = 1e6;
    else
        options.maxit = 1000;
    end
end
