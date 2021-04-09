function f = Atken(x,y,x0)
syms t;
if(length(x) == length(y))
    n = length(x);    
else
    disp('x��y��ά������ȣ�');
    return;
end                                      %���

y1(1:n) = t;                             %���ź�������Ҫ����ֵ
for(i=1:n-1)   
    for(j=i+1:n)
        y1(j) = y(j)*(t-x(i))/(x(j)-x(i))+y(i)*(t-x(j))/(x(i)-x(j));    
    end
    y = y1;
    simplify(y1);
end

if(nargin == 3)
    f = subs(y1(n),'t',x0);            %�����ֵ��ĺ���ֵ
else
    simplify(y1(n));                   %����
    f = collect(y1(n));                %����ֵ����ʽչ��
    f = vpa(f,6);                      %����ֵ����ʽ��ϵ������6λ���ȵ�С��
end
