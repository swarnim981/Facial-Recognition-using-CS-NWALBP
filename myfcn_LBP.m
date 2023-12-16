function ImgLBP=myfcn_LBP(g)
% input: g LBP template window with size of 3*3
sz=size(g);

rows=sz(1);
column=sz(2);

center=ceil(rows/2);

result=zeros(rows,column);

for i=1:sz(1)
    for j=1:sz(2)
        if g(center,center)<=g(i,j)  % comparing each pixel intensity in 3*3 window with center pixel intensity
                result(i,j)=1; % it is assigned 1 if pixel intensity is greater than center pixel intensity else assigned 0
        end
        
    end

end

ImgLBP=result; % returns LBP  binary code of given input window
end