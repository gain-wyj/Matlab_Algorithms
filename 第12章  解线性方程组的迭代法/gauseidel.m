function [x,n]=gauseidel(A,b,x0,eps,M)
if nargin==3
    eps= 1.0e-6;
    M  = 200;
elseif nargin == 4
    M  = 200;
elseif nargin<3
    error
    return;
end      
D=diag(diag(A));    %��A�ĶԽǾ���
L=-tril(A,-1);      %��A����������
U=-triu(A,1);       %��A����������
G=(D-L)\U;
f=(D-L)\b;
x=G*x0+f;
n=1;                  %��������
while norm(x-x0)>=eps
    x0=x;
    x=G*x0+f;
    n=n+1;
    if(n>=M)
        disp('Warning: ��������̫�࣬���ܲ�������');
        return;
    end
end
