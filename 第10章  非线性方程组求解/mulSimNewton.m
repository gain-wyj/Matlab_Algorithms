function [r,n]=mulSimNewton(F,x0,eps) 
%�����Է����飺f
%��ʼ�⣺a
%��ľ��ȣ�eps
%��õ�һ��⣺r
%����������n

if nargin==2
    eps=1.0e-6;
end

x0 = transpose(x0);
Fx = subs(F,findsym(F),x0);
dF = Jacobian(F);
c = subs(dF,findsym(dF),x0);
r=x0-inv(c)*Fx;
n=1;
tol=1;
while tol>eps
    x0=r;
    Fx = subs(F,findsym(F),x0);
    r=x0-inv(c)*Fx;                                 %���ĵ�����ʽ
    tol=norm(r-x0);
    n=n+1;
    if(n>100000)                                              %������������
        disp('��������̫�࣬���ܲ�������');
        return;
    end
end
