function h =myfcn_CSLBP(g)
%% this function takes patch or image as input and return Histogram of
%% CSLBP operator. 

result=zeros(1,4);
if g(2,3)>g(2,1)
    result(1,4)=1;
end
if g(1,3)>g(3,1)
    result(1,3)=1;

end
if g(1,2)>g(3,2)
    result(1,2)=1;
end
if g(1,1)>g(3,3)
    result(1,1)=1;
end
sum=0;
szele=size(result);
for j=1:szele(2)
            sum=sum+result(1,j)*2^(szele(2)-j);
end
h=sum;
    
end
