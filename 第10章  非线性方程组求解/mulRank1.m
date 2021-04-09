function [r,n]=mulRank1(F,x0,A,eps)
if nargin==2
    l = length(x0);
    A=eye(l);                             %AȡΪ��λ��
    eps=1.0e-4;
else
   if nargin==3
         eps=1.0e-4;
    end
end

fx = subs(F,findsym(F),x0);
r=transpose(x0)-inv(A)*fx;
n=1;
tol=1;
while tol>eps
    x0=r;
    fx = subs(F,findsym(F),x0);
    r=x0-inv(A)*fx;
    y=r-x0;
    fr = subs(F,findsym(F),r);
    z = fr-fx;
    A1=A+ fr *transpose(fr)/(transpose(fr)*y);                   %����A
    A=A1;
    n=n+1;
    if(n>100000)                                   %������������
        disp('��������̫�࣬���ܲ�������');
        return;
    end
    tol=norm(r-x0);
end
