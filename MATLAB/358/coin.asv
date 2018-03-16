function [c,score] = coin(experiments, N )
%COIN Summary of this function goes here
%   Detailed explanation goes here
c=randn(experiments,N);
for j=1:experiments
    for i=1:N
        if(c(j,i)<0)
            c(j,i)=0;
        end

        if(c(j,i)>0)
            c(j,i)=1;
        end
    end

score(j)=sum(c(j,:));
end

end

