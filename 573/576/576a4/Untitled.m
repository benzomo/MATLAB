Y=[-1:.1:1];
O=[-2:.1:2];
a=.21;

for j=1:length(O)
    for i=1:length(Y)
        P(i,:)=abs(roots([1 (Y(i)-a) (O(j)) 2]));
    end
end

     