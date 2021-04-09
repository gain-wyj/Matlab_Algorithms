function [r,m]=mulMix(F,x0,h,l,eps)
if nargin==4
    eps=1.0e-4;
end

n = length(x0);
J = zeros(n,n);
Fx = subs(F,findsym(F),x0);
for i=1:n
    x1 = x0;
    x1(i) = x1(i)+h(i);
    J(:,i) = (subs(F,findsym(F),x1)-Fx)/h(i);
end
D = diag(diag(J));
C = D - J;
inD = inv(D);
H = inD*C;
Hm = eye(n,n);
for i=1:l-1
    Hm = Hm + power(H,i);
end
dr = Hm*inD*Fx;
r = transpose(x0)-dr;                               
m=1;
tol=1;
while tol>eps
    x0=r;   
    Fx = subs(F,findsym(F),x0);
    J = zeros(n,n);
    for i=1:n
        x1 = x0;
        x1(i) = x1(i)+h(i);
        J(:,i) = (subs(F,findsym(F),x1)-Fx)/h(i);
    end
    D = diag(diag(J));
    C = D - J;
    inD = inv(D);
    H = inD*C;
    Hm = eye(n,n);
    for i=1:l-1
        Hm = Hm + power(H,i);
    end
    dr = Hm*inD*Fx;    
    r = x0-dr;                                 %���ĵ�����ʽ
    tol=norm(r-x0);
    m=m+1;
    if(m>100000)                                              %������������
        disp('��������̫�࣬���ܲ�������');
        return;
    end
end
