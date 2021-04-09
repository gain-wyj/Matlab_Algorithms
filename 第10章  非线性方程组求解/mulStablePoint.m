function [r,n]=mulStablePoint(F,x0,eps)
%�����Է����飺f
%��ʼ�⣺a
%��ľ��ȣ�eps
%��õ�һ��⣺r
%����������n

if nargin==2
    eps=1.0e-6;
end

x0 = transpose(x0);
n=1;
tol=1;
while tol>eps
    r= subs(F,findsym(F),x0);                           %������ʽ
    tol=norm(r-x0);                    %ע����������󷨣�normΪ�����ŷ����·���
    n=n+1;
    x0=r;
    if(n>100000)                        %������������
        disp('��������̫�࣬���ܲ�������');
        return;
    end
end
