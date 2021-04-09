function [r,m]=mulDNewton(F,x0,eps) 
%�����Է����飺F
%��ʼ�⣺x0
%��ľ��ȣ�eps
%��õ�һ��⣺r
%����������n

if nargin==2
    eps=1.0e-4;
end

x0 = transpose(x0);
dF = Jacobian(F);
m=1;
tol=1;
while tol>eps
    ttol=1;
    w=1;
    Fx = subs(F,findsym(F),x0);
    dFx = subs(dF,findsym(dF),x0);
    F1=norm(Fx);
    while ttol>=0                               %�����ѭ����ѡȡ��ɽ����w�Ĺ���
        r=x0-w*inv(dFx)*Fx;                         %���ĵĵ�����ʽ
        Fr = subs(F,findsym(F),r);
        ttol=norm(Fr)-F1;
        w=w/2;
    end
    tol=norm(r-x0);
    m=m+1;
    x0=r;
    if(m>100000)                                 %������������
        disp('��������̫�࣬���ܲ�������');
        return;
    end
end
