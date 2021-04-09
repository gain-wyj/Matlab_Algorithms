function [x,XA]= GaussXQAllMain (A,b) 
N = size(A);
n = N(1);
index_l = 0;
index_r = 0;
order = 1:n;                           %��¼δ֪��˳�������

for i=1:(n-1)
    me = max(max(abs(A(i:n,i:n))));    %ѡȡȫ��Ԫ
    for k=i:n
        for r=i:n
            if(abs(A(k,r))==me)
                index_l = k;
                index_r = r;      %������Ԫ���ڵ��к���
                k=n;
                break;
            end
        end
     end
     temp = A(i,1:n);
     A(i,1:n) =  A(index_l,1:n);
     A(index_l,1:n) = temp;
     bb = b(index_l);
     b(index_l)=b(i);
     b(i) = bb;                  %��������
     
     temp = A(1:n,i);
     A(1:n,i) = A(1:n,index_r);
     A(1:n,index_r) = temp;       %��������
     
     pos = order(i);
     order(i) = order(index_r);
     order(index_r) = pos;        %���еĽ��������δ֪��˳��ı仯        
     
     for j=(i+1):n
        if(A(i,i)==0)
            disp('�Խ�Ԫ��Ϊ0��');
            return;
        end
        l = A(j,i);
        m = A(i,i);
        A(j,1:n)=A(j,1:n)-l*A(i,1:n)/m;
        b(j)=b(j)-l*b(i)/m;
    end
end

x=SolveUpTriangle(A,b);

y=zeros(n,1);
for i=1:n
    for j=1:n
        if(order(j)==i)
            y(i)=x(j);
        end
    end
end                      %�ָ�δ֪��ԭ����˳��
x=y;
XA = A;
