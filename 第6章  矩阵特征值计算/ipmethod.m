function [l,v]=ipmethod(A,x0,eps)
if nargin==2 
    eps = 1.0e-6;
end

v = x0;               
M = 5000;              %������������
m = 0; 
l = 0;

for(k=1:M)
    y = A\v;
    m = max(y);      %mΪ��ģ���ķ���
    v = y/m;
    
    if(abs(m - l)<eps)
        l = 1/m;   %�����辫�ȣ��˳���lΪ��ģ����С����ֵ
        return;
    else
        if(k==M)
            disp('��������̫�࣬�����ٶ�̫����');
            l = 1/m;
        else
            l = m; 
        end
    end
end


        