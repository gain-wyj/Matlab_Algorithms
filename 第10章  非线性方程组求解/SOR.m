function [x,n]=SOR(A,b,x0,w,M,eps)
%���ó��ɳڵ����������Է�����Ax=b�Ľ�
%���Է������ϵ������A
%���Է������еĳ���������b
%������ʼ������x0
%�ɳ����ӣ�w
%��ľ��ȿ��ƣ�eps
%�����������ƣ�M
%���Է�����Ľ⣺x
%������辫�ȵĽ�ʵ�ʵĵ���������n
if nargin==4
    eps= 1.0e-6;
    M  = 10000;
elseif nargin == 5
    eps  = 1.0e-6;
end      

if(w<=0 || w>=2)
    error;
    return;
end

D=diag(diag(A));    %��A�ĶԽǾ���
L=-tril(A,-1);      %��A����������
U=-triu(A,1);       %��A����������
B=inv(D-L*w)*((1-w)*D+w*U);
f=w*inv((D-L*w))*b;
x=x0;
n=0;                  %��������
tol=1;                %ǰ�����ε���������
while tol>=eps
    x = B*x0+f;       %������ʽ
    n = n+1;
    tol = norm(x-x0);
    x0 = x;
    if(n>=M)
        disp('Warning: ��������̫�࣬���ܲ�������');
        return;
    end
end
