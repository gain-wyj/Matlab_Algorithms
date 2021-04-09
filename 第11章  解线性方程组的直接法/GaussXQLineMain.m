function [x,XA]=GaussXQLineMain(A,b) 
N = size(A);
n = N(1);
index = 0;

for i=1:(n-1)
    me = max(abs(A(1:n,i)));       %ѡȡ����Ԫ
    for k=i:n
        if(abs(A(k,i))==me)
            index = k;             %��������Ԫ���ڵ���
            break;
        end
     end
     temp = A(i,1:n);
     A(i,1:n) =  A(index,1:n);
     A(index,1:n) = temp;
     bb = b(index);
     b(index)=b(i);
     b(i) = bb;                    %��������
     
     for j=(i+1):n
        if(A(i,i)==0)
            disp('�Խ�Ԫ��Ϊ0��');
            return;
        end
        l = A(j,i);
        m = A(i,i);
        A(j,1:n)=A(j,1:n)-l*A(i,1:n)/m;     
        b(j)=b(j)-l*b(i)/m;         %��Ԫ
    end
end

x=SolveUpTriangle(A,b);             
XA = A;
