function pr=pacf(x,m,plfg)
%
% pr=pacf(x,m,plfg)
%
% computes the pacf of the series in x
%
% x = input series
% m = maximum lag to compute
% pr = pacf(j) j=1:m
% compute the ACF terms using xcorr
z=xcorr(x,m,'coeff');
% first compute all the sample correlations needed
nx=length(x);
%rho=acf(x,3);  % divide by sample var * no samples in kth product
rho=acf(x,1);  % divide by sample var * tot samples
% r=xcov(x,'unbiased'); % using xcov has 2nx-1 el
% sigsq=r(nx);% the middle one is the variance
% rho=r(nx:nx+m)/sigsq;% lag 0 to end
pr(1)=rho(2); % lag 1 rho
%pr=zeros(1,m);
for k=2:m
   pmat=toeplitz(rho(1:k));% lag 0 to k-1
   rhovec=rho(2:k+1);		% lag 1 to k
   phi=inv(pmat)*rhovec;
   pr(k)=phi(k);
end
if plfg
   figure;  % plot both the ACF terms and the PACF
   subplot(311); plot(x); subplot(312); stem(0:m,z(m+1:end)); 
   title('ACF of time series'); xlabel('Lags');ylabel('ACF'); subplot(313);
   ALPHA=.05;
   stem(pr);
   hold on;
   thr=norminv(1-ALPHA/2,0,1/sqrt(nx));% later replace with rinv
   plot([1:m],thr*ones(size(pr)),'--r',[1:m],-thr*ones(size(pr)),'--r');
   title(['PACF, Number of Samples=',int2str(nx),' alpha = ',num2str(ALPHA)]);xlabel('Lags'); ylabel('PACF');
   
end

      
   