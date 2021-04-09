function [r,m]=mulFastDown(F,x0,h,eps)
format long;
if nargin==3
    eps=1.0e-8;
end

n = length(x0);
x0 = transpose(x0);
m=1;
tol=1;
while tol>eps
    fx = subs(F,findsym(F),x0);
    J = zeros(n,n);
    for i=1:n
        x1 = x0;
        x1(i) = x1(i)+h;
        J(:,i) = (subs(F,findsym(F),x1)-fx)/h;
    end
    lamda = fx/sum(diag(transpose(J)*J));
    r=x0-J*lamda;  %���ĵ�����ʽ
    fr = subs(F,findsym(F),r);    
    tol=dot(fr,fr);
    x0 = r;
    m=m+1;
    if(m>100000)                                              %������������
        disp('��������̫�࣬���ܲ�������');
        return;
    end
end
format short;