function ImgCSNWALBP=myfcn_CSNWALBP(g)
sz=size(g);

rows=sz(1);
column=sz(2);

center=ceil(rows/2);
j=0; %threshold value
result=zeros(1,4);
for j=0:0.1:5
if g(2,3)>=g(2,1)+j
    result(1,4)=1;
end
if g(1,3)>=g(3,1)+j
    result(1,3)=1;

end
if g(1,2)>=g(3,2)+j
    result(1,2)=1;
end
if g(1,1)>=g(3,3)+j
    result(1,1)=1;
end

sum=0;
szele=size(result);
for j=1:szele(2)
            sum=sum+result(1,j)*2^(szele(2)-j);
end
ImgCSNWALBP=sum;
end