function [f,f0] = SubHermite(x,y,y_1,x0)
syms t;
f = 0.0;
f0 = 0.0;

if(length(x) == length(y))
    if(length(y) == length(y_1))
        n = length(x);
    else
        disp('y��y�ĵ�����ά������ȣ�');
        return;
    end
else
    disp('x��y��ά������ȣ�');
    return;
end                  %ά�����

for i=1:n
    if(x(i)<=x0)&& (x(i+1)>=x0)
        index = i;
        break;
    end
end                          %�ҵ�x0��������

h = x(index+1) - x(index);   %x0�������䳤��
fl = y(index)*(1+2*(t-x(index))/h)*(t-x(index+1))^2/h/h + ...
        y(index+1)*(1-2*(t-x(index+1))/h)*(t-x(index))^2/h/h;
fr = y_1(index)*(t-x(index))*(t-x(index+1))^2/h/h + ...
        y_1(index+1)*(t-x(index+1))*(t-x(index))^2/h/h;    
f = fl + fr;                %x0��������Ĳ�ֵ����
f0 = subs(f,'t',x0);        %x0���Ĳ�ֵ
