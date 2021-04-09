function [x,n]=JOR(A,b,x0,w,eps,M)
if nargin==4
    eps= 1.0e-6;
    M  = 10000;
elseif nargin ==5
    M  = 10000;
end  
if(w<=0 || w>=2)     %��������Ҫ��
    error;
    return;
end
D=diag(diag(A));    %��A�ĶԽǾ���
B=w*inv(D);
%��������
x=x0;
n=0;                                      %��������
tol=1;
%��������
while tol>=eps
    x=x0-B*(A*x0-b);
    n  = n+1;
    tol = norm(x-x0);
    x0 = x;
    if(n>=M)
        disp('Warning: ��������̫�࣬���ܲ�������');
        return;
    end
end
