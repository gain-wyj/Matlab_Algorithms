function l = qrtz(A,M)

for(i=1:M)                 %MΪ��������
    [q,r]=qr(A);
    A = r*q;
    l = diag(A);
end
