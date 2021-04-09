function [x,IA]=InvAddSide(A,b)
IA = Inv(A);
x = IA*b;

%�������ĵݹ麯��
function invA=Inv(A)
N = size(A);
n = N(1);
if(n == 1)
    invA = 1/A(n,n);                   %�ݹ����ֹ����
else
    u = A(1:(n-1),n);
    v = A(n,1:(n-1));
    iA = Inv(A(1:(n-1),1:(n-1)));   %�ݹ鹫ʽ
    An = A(n,n) - v*iA*u;
    r = -iA*u/An;
    p = iA + iA*u*v*iA/An;
    q = -v*iA/An;
    invA = [p r;q 1/An];               %�����
end
