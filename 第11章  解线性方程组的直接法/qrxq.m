function [x,Q,R]=qrxq(A,b) 
N = size(A);
n = N(1);
B = A;                        %����ϵ������

A(1:n,1)=A(1:n,1)/norm(A(1:n,1)); %��A�ĵ�һ�����滯
for i=2:n
    for j=1:(i-1)
        A(1:n,i)= A(1:n,i)-dot(A(1:n,i),A(1:n,j))*A(1:n,j); 
        %ʹA�ĵ�i����ǰ�����е�������
    end
    A(1:n,i)=A(1:n,i)/norm(A(1:n,i));
    %��A�ĵ�i�����滯
end
Q = A;                               %�ֽ��������������
R = transpose(Q)*B;
x=SolveUpTriangle(R,transpose(Q)*b);  %��ⷽ��
