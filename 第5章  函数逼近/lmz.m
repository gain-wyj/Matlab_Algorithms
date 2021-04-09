function [coff,err]= lmz(func,m,a,b,eps) 
if(nargin == 4)
    eps=1.0e-6;
end
syms v;
maxv = 0.0;
max_x = a;               %��¼abs(f(x)-p(x))ȡ���ֵ��x
for k=0:m
   px(k+1)=power(v,k);
end                      %p��x������ʽ
for  i=1:m+2
    x(i)=0.5*(a+b+(b-a)*cos(3.14159265*(m+2-i)/(m+1)));
    fx(i)=subs(sym(func), findsym(sym(func)),x(i));
end                      %��ʼ��x��f(x)
A = zeros(m+2,m+2);
for i=1:m+2
    for j=1:m+1
        A(i,j)=power(x(i),j-1);
    end
    A(i,m+2)=(-1)^i;
end
c =A\transpose(fx);    %p(x)�ĳ�ʼϵ��
u = c(m+2);            %�㷨�е�u        
tol = 1;               %����

while(tol>eps)
    t = a;
    while(t<b)        %��ѭ���ҳ�abs(f(x)-p(x))ȡ���ֵ��x
        t = t + 0.05*(b-a)/m;
        px1 = subs(px,'v',t);
        pt = px1*c(1:m+1);
        ft = subs(sym(func), findsym(sym(func)),t);
        if abs(ft-pt)>maxv
            maxv = abs(ft-pt);
            max_x = t;
        end
    end   
    if max_x>b
        max_x = b;
    end   
    %���¿ɲο��㷨������ȷ���µ㼯�����
    if (a<=max_x)&&(max_x<=x(2))          %��һ�����
        f0 = subs(sym(func), findsym(sym(func)),x(2));
        px1 = subs(px,'v',x(2));
        pt = px1*c(1:m+1);
        d1 = f0 - pt;
        fm = subs(sym(func), findsym(sym(func)),max_x);
        pm1 = subs(px,'v',max_x);
        pm = pm1*c(1:m+1);
        d2 = fm - pm;
        if d1*d2>0
            x(2) = max_x;
        end
    else
        if (x(m+1)<=max_x)&&(max_x<=b)   %�ڶ������
            f0 = subs(sym(func), findsym(sym(func)),x(m+1));
            px1 = subs(px,'v',x(m+1));
            pt = px1*c(1:m+1);
            d1 = f0 - pt;
            fm = subs(sym(func), findsym(sym(func)),max_x);
            pm1 = subs(px,'v',max_x);
            pm = pm1*c(1:m+1);
            d2 = fm - pm;
            if d1*d2>0
                x(m+1) = max_x;
            end
        else                           %���������
            for i=2:m
                if(x(i)<=max_x)&& (x(i+1)>=max_x)
                    index_x = i;
                    break;
                end
            end                       %�ҵ�max_x��������
            f0 = subs(sym(func), findsym(sym(func)),x(index_x));
            px1 = subs(px,'v',x(index_x));
            pt = px1*c(1:m+1);
            d1 = f0 - pt;
            fm = subs(sym(func), findsym(sym(func)),max_x);
            pm1 = subs(px,'v',max_x);
            pm = pm1*c(1:m+1);
            d2 = fm - pm;
            if d1*d2>0
                x(index_x) = max_x;
            end
        end
    end
    for  i=1:m+2                   %���¼���f��x��
        fx(i)=subs(sym(func), findsym(sym(func)),x(i));
    end
    for i=1:m+2
        for j=1:m+1
            A(i,j)=power(x(i),j-1);
        end
        A(i,m+2)=(-1)^i;
    end
    c =A\transpose(fx);           %���¼���p��x����ϵ��
    tol = abs(c(m+2)-u);    
    u = c(m+2);
end
coff = c(1:m+1);
err = u;
