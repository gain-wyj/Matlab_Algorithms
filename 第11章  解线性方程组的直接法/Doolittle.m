function [x,L,U]= Doolittle (A,b)
N = size(A);
n = N(1);
L = eye(n,n);               %L�ĶԽ�Ԫ��Ϊ1
U = zeros(n,n);

U(1,1:n) = A(1,1:n);        %U�ĵ�һ��
L(1:n,1) = A(1:n,1)/U(1,1); %L�ĵ�һ��

for k=2:n
    for i=k:n
        U(k,i) = A(k,i)-L(k,1:(k-1))*U(1:(k-1),i);
        %U�ĵ�k��
    end
    for j=(k+1):n
        L(j,k) = (A(j,k)-L(j,1:(k-1))*U(1:(k-1),k))/U(k,k);
        %L�ĵ�k��
    end
end

y = SolveDownTriangle(L,b);
x = SolveUpTriangle(U,y);    %��ⷽ��
