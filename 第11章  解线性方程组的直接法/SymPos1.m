function [x,L]= SymPos1 (A,b)
N = size(A);
n = N(1);
L(1,1) = sqrt(A(1,1));
L(2:n,1) = A(2:n,1)/L(1,1);   %L�ĵ�һ��

for k=2:n
    L(k,k) = sqrt(A(k,k)-L(k,1:(k-1))*transpose(L(k,1:(k-1)))); 
    %L�ĶԽ�Ԫ��
    for i=(k+1):n
        L(i,k) = (A(i,k)-L(i,1:(k-1))*transpose(L(k,1:(k-1))))/L(k,k);
        %L�ĵ�k��
    end
end

y = SolveDownTriangle(L,b);
x = SolveUpTriangle(transpose(L),y);   %��ⷽ��
