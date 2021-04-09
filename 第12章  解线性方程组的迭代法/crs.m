function [x,n]=crs(A,b,x0,w,eps,M)
if(nargin == 4)
    eps = 1.0e-6;                             %eps��ʾ��������
      M = 10000;                                %M��ʾ��������������ֵ
elseif(nargin == 5)
      M = 10000;
end
I =eye(size(A));
n=0;
x=x0;
tol=1;
%��������
while (tol>eps)
    x = (I-w*A)*x0+w*b;
    n = n + 1;                                    %nΪ���������ʱ�ĵ�������
    tol = norm(x-x0);
    x0 = x;
    if(n>=M)
        disp('Warning:��������̫�࣬���ܲ�������');
        return;
    end
end
