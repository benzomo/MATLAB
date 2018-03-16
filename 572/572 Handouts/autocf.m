function [r,ci,nr]=autocf(z,M,E)
%AUTOCF [r,ci,nr]=autocf(z,M,E)
%	Computes the autocorrelation function for the vector z and the
%	confidence intervals. z is an [N,1] vector where N=number of data 
%	points.
%
%	The autocorrelation function of z is computed and displayed. 
%	The 2-standard deviation confidence limits (95%) for these values 
%	are given by 2/sqrt(N) if E=0 or by Bartlett's equation if E=1.
%	While Bartlett's equation is more rigorous, the estimate of
%	2/sqrt(N) is good enough for most cases.

%	E. M. Heaven
%	April, 1989

[N,nz]=size(z);
if E==1 
   r=covf(z,(2*M+1));
   r=r/r(1);
%    ** Confidence interval for the autocorrelation function **
   for k=1:M+1,
     sum=0;
     for v=1:M+1,
%    use Bartlett's equation for variance estimate
     kk=k-1;
      sum=sum+r(v)^2 + r(v+kk)*r(v+kk) - 4*r(k)*r(v)*r(v+kk) + 2*r(v)^2*r(k)^2;
     end
     var(k)=2*sum/N;		% *2 to get both sides of summation
   end
   sdre=2.*sqrt(var);		% confidence interval is +/- 2 sigma
   ci=[sdre(1:M) -sdre(1:M)];
   nr=0:M;
   z=zeros(M+1);
   plot(nr,r(1:M+1),'ok',nr,r(1:M+1),'k',nr,z,'k',nr,sdre(1:M+1),':k',nr,-sdre(1:M+1),':k');
   title('Auto-correlation Function'),xlabel('lag');
else
   r=covf(z,(M+1));
   r=r/r(1);
   sdre=2/sqrt(N)*ones((M+1),1);
   ci=[sdre -sdre];
   nr=0:M;
   z=zeros(M+1);
   plot(nr,r(1:M+1),'ok',nr,r(1:M+1),'k',nr,z,'k',nr,sdre,':k',nr,-sdre,':k');
   title('Auto-correlation Function'),xlabel('lag');
end
