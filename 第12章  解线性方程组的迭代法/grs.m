function [x,n]=grs(A,b,x0,W,eps,M)
if(nargin == 4)
    eps = 1.0e-6;                            %eps��ʾ��������
      M = 10000;                              %M��ʾ��������������ֵ
elseif(nargin == 5)
      M = 10000;
end
I =eye(size(A));
n=0;
x=x0;
tol=1;                                         %ǰ�����ε���������
%��������
while (tol>eps)
    x = (I-W*A)*x0+W*b;                     %������ʽ
    n = n + 1;                                  %nΪ���������ʱ�ĵ�������
    tol = norm(x-x0);
    x0 = x;
    if(n>=M)
        disp('Warning:��������̫�࣬���ܲ�������');
        return;
    end
end
