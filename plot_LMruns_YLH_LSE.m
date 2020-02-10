function plot_LMruns_LSE(n,startpert,maxit)
fsize = 13;

[fB,dnormB,iterB, fLB1scale,dnormLB1scale,iterLB1scale,fLB1noscale,dnormLB1noscale,iterLB1noscale,muvalues]... 
= LMruns_YLH_LSE(n,startpert,maxit);

figure(1)
clf
loglog(muvalues,fB,'ko')
hold on
loglog(muvalues,fLB1scale,'m*')
hold on
loglog(muvalues,fLB1noscale,'cs')
legend({'BFGS','L-BFGS-1-scale','L-BFGS-1-noscale'}, 'FontSize', fsize)
title(sprintf('Smoothed Yurii-Les-Houches Max Function, n=%d, startpert=%g', n, startpert),'FontSize',fsize)
xlabel('smoothing parameter mu', 'FontSize', fsize)
ylabel('final function value', 'FontSize', fsize)


figure(2)
clf
loglog(muvalues,iterB,'ko')
hold on
loglog(muvalues,iterLB1scale,'m*')
hold on
loglog(muvalues,iterLB1noscale,'cs')
legend({'BFGS','L-BFGS-1-scale','L-BFGS-1-noscale'}, 'FontSize', fsize)
title(sprintf('Smoothed Yuri-Les-Houches Max Function, n=%d, startpert=%g', n, startpert),'FontSize',fsize)
xlabel('smoothing parameter mu', 'FontSize', fsize)
ylabel('iterations needed', 'FontSize', fsize)

