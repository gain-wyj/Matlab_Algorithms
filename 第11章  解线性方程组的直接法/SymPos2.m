function [x,L,D]= SymPos2 (A,b)
N = size(A);
n = N(1);
L = eye(n,n);      %L�ĶԽ�Ԫ��Ϊ1
d = zeros(n,1);
for k=1:n 
    d(k,1) = A(k,k)-L(k,1:(k-1)).*L(k,1:(k-1))*d(1:(k-1),1);
    %D�ĵ�k���Խ�Ԫ��
    for i=(k+1):n
        L(i,k) = (A(i,k)-L(i,1:(k-1)).*L(k,1:(k-1))*d(1:(k-1),1))/d(k,1);
        %L�ĵ�k��
    end
end

D = diag(d);
y = SolveDownTriangle(L,b);      %���y
for i=1:n
    y(i,1)=y(i,1)/d(i,1);
end
x = SolveUpTriangle(transpose(L),y);  %���x
