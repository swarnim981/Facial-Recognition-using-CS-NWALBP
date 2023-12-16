function im1=nwlbp_calculation(img)
%Taking inner and outer layer neighbourhood pixels in different directiond
%of NWALBP template window
i0=img(2:4,3:5);%0 degree
i45=img(1:3,3:5);%45 degree
i90=img(1:3,2:4);%90 degree
i135=img(1:3,1:3);%135 degree
i180=img(2:4,1:3);%180 degree
i225=img(3:5,1:3);%225 degree
i270=img(3:5,2:4);% 270 degree
i315=img(3:5,3:5);% 315 degree

% krish operator in eight directions
k0=[0 2 1;0 2 1;0 2 1]; % 0 degree
k45=[0 1 1;2 2 1;0 2 0]; % 45 degree
k90=[1 1 1;2 2 2;0 0 0]; % 90 degree
k135=[1 1 0;1 2 2;0 2 0] ; % 135 degree
k180=[1 2 0;1 2 0;1 2 0];  %180 degree
k225=[0 2 0 ;1 2 2;1 1 0];%225 degree
k270=[0 0 0;2 2 2;1 1 1];%270 degree
k315=[0 2 0; 2 2 1;0 1 1]; % 315 degree
w=uint8(zeros(3,3));
% calculating corrresponding weights 
w(2,3)=sum((i0 .*uint8( k0)),'all')*(1/9);  %w0
w(1,3)=sum((i45.* uint8(k45)),'all')*(1/9);%w1
w(1,2)=sum((i90 .* uint8(k90)),'al')*(1/9);%w2
w(1,1)=sum((i135.*uint8(k135)),'all')*(1/9);%w3
w(2,1)=sum((i180 .*uint8(k180)),'all')*(1/9); %w4
w(3,1)=sum((i225.*uint8 (k225)),'all')*(1/9);%w5
w(3,2)=sum((i270 .*uint8(k270)),'all')*(1/9);%w6
w(3,3)=sum((i315.*uint8(k315)),'all')*(1/9);%w7
w(2,2)=img(3,3);
im1=w; % returing a 3*3 window of weights calculated
end

