function df = Richason(func, x0, n, h)
if nargin == 3 
    h = 1;
else if (nargin == 3 && h == 0.0)
        disp('h����Ϊ0��');
        return;
    end
end

for(i=1:n)
    y1 = subs(sym(func), findsym(sym(func)),x0+h/(2^i));
    y2 = subs(sym(func), findsym(sym(func)),x0-h/(2^i));
    G(i) = 2^(i-1)*(y1-y2)/h;            %��ý������ĵײ�ֵ
end

G1 = G;
for(i=1:n-1)
    for(j=(i+1):n)
        G1(j)=(G(j)-(0.5)^(2*i)*G(j-1))/(1-(0.5)^(2*i)); %��ý�������ÿ��ֵ
    end
    G = G1;
end
    
df = G(n);    %����ֵ��������õ���ֵ
