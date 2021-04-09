function [x,n]=SSOR(A,b,x0,w,eps,M)
if nargin==4
    eps= 1.0e-6;
    M  = 200;
elseif nargin<4
    error
    return
elseif nargin ==5
    M  = 200;
end  

if(w<=0 || w>=2)
    error;
    return;
end

D=diag(diag(A));    %��A�ĶԽǾ���
L=-tril(A,-1);      %��A����������
U=-triu(A,1);       %��A����������
B1=inv(D-L*w)*((1-w)*D+w*U);
B2=inv(D-U*w)*((1-w)*D+w*L);
f1=w*inv((D-L*w))*b;
f2=w*inv((D-U*w))*b;

x12=B1*x0+f1;
x  =B2*x12+f2;
n=1;                  %��������

while norm(x-x0)>=eps
    x0=x;
    x12=B1*x0+f1;
    x  =B2*x12+f2;
    n=n+1;
    if(n>=M)
        disp('Warning: ��������̫�࣬���ܲ�������');
        return;
    end
end