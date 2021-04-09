function [x,IA]= Yesf(A,b)
N = size(A);
n = N(1);
A1 = A -eye(n,n);
A2 = zeros(n,n);
A3 = zeros(n,n);

for m=1:n
    for i=1:n
        for j=1:n
            if(i ~= m)
                A2(i,j) = A1(i,j);
            else
                if(j == m)
                    A2(i,j) = 1;
                else
                    A2(i,j) = 0;
                end
            end
        end
    end                                         %��һ������
    A3 = A2 - A2(1:n,m)*A1(m,1:n)/(1+A1(m,m));  %�ڶ�������
    A1 = A3;
end
IA=A3;
x = A3*b;         %��ⷽ��
