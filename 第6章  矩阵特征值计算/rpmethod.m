function [l,v,s]=rpmethod(A,x0,eps)
if nargin==2 
    eps = 1.0e-6;
end

v = x0;               %vΪ����������
M = 5000;              %������������
m = 0; 
l = 0;

for(k=1:M)
    y = A*v;
    m = (y'*v)/(v'*v);      %mΪ������
    if(rank(m)>1)
        m=(y*v')/(v*v');
    end
    v = y/m;
    
    if(abs(m - l)<eps)
        l = m;   %�����辫�ȣ��˳���lΪ������ֵ
        s = k;
        return;
    else
        if(k==M)
            disp('��������̫�࣬�����ٶ�̫����');
            l = m;
            s = M;
        else
            l = m; 
        end
    end
end


        