function r=DiffParam1(F,x0,h,N)
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

for k=1:N
    Fx  = subs(F,findsym(F),x0);
    J = zeros(n,n);
    for i=1:n
        x1 = x0;
        x1(i) = x1(i)+h(i);
        J(:,i) = (subs(F,findsym(F),x1)-Fx)/h(i);
    end
    inJ = inv(J);
    r = x0 - ht*inJ*Fx0;
    x0 = r;
end
    