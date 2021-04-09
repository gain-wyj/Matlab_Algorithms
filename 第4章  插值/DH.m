function fz = DH(x,y,x0,y0,zx,zy,zxy)
n = length(x);
m = length(y);

for i=1:n
    if(x(i)<=x0)&& (x(i+1)>=x0)
        index_x = i;
        break;
    end
end                          %�ҵ�x0��������
for i=1:m
    if(y(i)<=y0)&& (y(i+1)>=y0)
        index_y = i;
        break;
    end
end                          %�ҵ�y0��������
hx = x(index_x+1) - x(index_x);
hy = y(index_y+1) - y(index_y);
tx = (x0 - x(index_x))/hx;          %��ֵ�����һ��
ty = (y0 - y(index_y))/hy;          %��ֵ�����һ��

Hl = [(1-tx)^2*(1+2*tx)  tx*tx*(3-2*tx) tx*(1-tx)^2  tx*tx*(tx-1)];  %������
Hr = [(1-ty)^2*(1+2*ty);  ty*ty*(3-2*ty); ty*(1-ty)^2 ; ty*ty*(ty-1)];  %������
C = [Z(index_x, index_y) Z(index_x,index_y+1) zy(index_x, index_y) ...
zy(index_x, index_y+1);
Z(index_x+1, index_y) Z(index_x+1,index_y+1) zy(index_x+1, index_y) ...
zy(index_x+1, index_y+1);
zx(index_x, index_y) zy(index_x, index_y+1) zxy(index_x, index_y) ...
zxy(index_x, index_y+1);
zx(index_x+1, index_y) zy(index_x+1, index_y+1) zxy(index_x+1, index_y) ...
zxy(index_x+1, index_y+1)];          %C����
fz = Hl*C*Hr;
