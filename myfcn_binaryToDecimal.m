

function sum=myfcn_binaryToDecimal(g)
    sum=0;
     k=1;
    sz=size(g);

        elements=zeros(1,8);
        for j=1:sz(2)-1
            i=1;
            elements(k)=g(i,j);
            k=k+1;
        end
        for i=1 : sz(1)-1
            j=sz(2);
            elements(k)=g(i,j);
            k=k+1;
        end
        for j=sz(2):-1:2
            i=sz(1);
            elements(k)=g(i,j);
            k=k+1;
        end
        for i=sz(1):-1:2
            j=1;
            elements(k)=g(i,j);
            k=k+1;
        end

            szele=size(elements);

        
elements;
reversedArray = flip(elements);

        for j=1:szele(2)
            sum=sum+reversedArray(1,j)*2^(szele(2)-j);
        end
end

