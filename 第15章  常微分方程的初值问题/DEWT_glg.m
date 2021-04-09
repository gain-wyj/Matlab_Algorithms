function yy = DEWT_glg(f,h,a,b,gama,y0,order,varvec)
%һ�׳�΢�ַ��̵�һ����ʽ���Ҷ˺�����f
%���ֲ�����h
%�Ա���ȡֵ���ޣ�a
%�Ա���ȡֵ���ޣ�b
%���Ʋ������ο����ƹ�ʽ��gama
%������ֵ��y0
%���ƽ�����order
%��΢�ַ��̵ı����飺varvec

ArrayH = [1;2;4;6;8;12;16;24;32;48;64;96];
N = (b-a)/h;
yy = zeros(N+1,1);
for i = 2:N+1
    dh = h;
    s = zeros(order,1);
    for j=1:order
        dh = h/ArrayH(j);
        NI = (i-1)* ArrayH(j);
        tmpY = zeros(NI+2,1);
        tmpY(1) = y0;
        tmpY(2) = y0 + dh*Funval(f,varvec,[a+dh y0]);
        for m=3:NI+2
            tmpY(m) = tmpY(m-2)+ 2*dh*Funval(f,varvec,[a+(m-1)*dh tmpY(m-1)]);
        end
        s(j) = tmpY(NI)/4+ tmpY(NI+1)/2+ tmpY(NI+2)/4;
    end
    tmpS = zeros(order,1);
    for j=1:order-1
        for k=(j+1):order
            tmpS(k) = s(k)+(s(k)-s(k-1))/((ArrayH(k)/ArrayH(j))^gama-1);
        end
        s(1:(order-j)) = tmpS((j+1):order);
    end
    yy(i) = tmpS(order);
end
