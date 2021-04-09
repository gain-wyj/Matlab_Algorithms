function [r,m]=mulVNewton(F,x0,A,eps) 
%�����飺F
%������ĳ�ʼ�⣺x0
% ��ʼA����A
%��ľ��ȣ�eps
%��õ�һ��⣺r
%����������m

if nargin==2
    A=eye(length(x0)); %AȡΪ��λ��
    eps=1.0e-4;
else
   if nargin==3
         eps=1.0e-4;
   end
end

x0 = transpose(x0);
Fx = subs(F, findsym(F),x0);
r=x0-A\Fx;
m=1;
tol=1;
while tol>eps
    x0=r;
    Fx = subs(F, findsym(F),x0);
    r=x0-A\Fx;
    y=r-x0;
    Fr = subs(F, findsym(F),r);
    z= Fr-Fx;
    A1=A+(z-A*y)*transpose(y)/norm(y);                   %����A
    A=A1;
    m=m+1;
    if(m>100000)                                   %������������
        disp('��������̫�࣬���ܲ�������');
        return;
    end
    tol=norm(r-x0);
end
