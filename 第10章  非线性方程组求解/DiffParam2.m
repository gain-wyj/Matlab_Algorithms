function r=DiffParam2(F,x0,h,N)
%�����Է����飺f
%��ʼ�⣺x0
%��ֵ΢����������С��h
%�ſɱȵ�������:l
%��ľ��ȣ�eps
%��õ�һ��⣺r
%����������n

x0 = transpose(x0);
n = length(x0);
ht = 1/N;
Fx0  = subs(F,findsym(F),x0);
J = zeros(n,n);
for i=1:n
    xt = x0;
    xt(i) = xt(i)+h(i);
    J(:,i) = (subs(F,findsym(F),xt)-Fx0)/h(i);
end
inJ = inv(J);
x1 = x0 - ht*inJ*Fx0;

for k=1:N
    x2 = x1 + (x1-x0)/2;
    Fx2  = subs(F,findsym(F),x2);
    J = zeros(n,n);
    for i=1:n
        xt = x2;
        xt(i) = xt(i)+h(i);
        J(:,i) = (subs(F,findsym(F),xt)-Fx2)/h(i);
    end
    inJ = inv(J);
    r = x1 - ht*inJ*Fx0;
    x0 = x1;
    x1 = r;
end