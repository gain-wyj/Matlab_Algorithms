function [x,N]= BGS(A,b,x0,d,eps,M)
if nargin==4
    eps= 1.0e-6;
    M  = 10000;
elseif nargin<4
    error
    return
elseif nargin ==5
    M  = 10000;
end  

NS = size(A);
n = NS(1,1);
bnum = length(d);
bs = ones(bnum,1);
for i=1:(bnum-1)
    bs(i+1,1)=sum(d(1:i))+1;
    %��öԽ�����ÿ���ֿ����Ԫ����������ʼֵ
end

DB = zeros(n,n);       
for i=1:bnum
    endb = bs(i,1)+d(i,1)-1;
    DB(bs(i,1):endb,bs(i,1):endb)=A(bs(i,1):endb,bs(i,1):endb);
    %��A�ĶԽǷֿ����
end
LB = -tril(A-DB);      %��A�������Ƿֿ���
UB = -triu(A-DB);      %��A�������Ƿֿ���

N = 0;
tol = 1;
while tol>=eps 
    invDL = inv(DB-LB);
    x = invDL*UB*x0+invDL*b;    %�������ʽ
    N = N+1;
    tol = norm(x-x0);
    x0 = x;
    if(N>=M)
        disp('Warning: ��������̫�࣬���ܲ�������');
        return;
    end
end
