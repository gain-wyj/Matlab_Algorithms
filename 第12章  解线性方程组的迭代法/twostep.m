function [x,n]=twostep(A,b,x0,eps,varargin)
if nargin==3
    eps= 1.0e-6;
    M  = 200;
elseif nargin<3
    error
    return
elseif nargin ==5
    M  = varargin{1};
end  

D=diag(diag(A));    %��A�ĶԽǾ���
L=-tril(A,-1);      %��A����������
U=-triu(A,1);       %��A����������
B1=(D-L)\U;
B2=(D-U)\L;
f1=(D-L)\b;
f2=(D-U)\b;

x12=B1*x0+f1;
x  =B2*x12+f2;
n=1;                  %��������

while norm(x-x0)>=eps
    x0 =x;
    x12=B1*x0+f1;
    x  =B2*x12+f2;
    n=n+1;
    if(n>=M)
        disp('Warning: ��������̫�࣬���ܲ�������');
        return;
    end
end


