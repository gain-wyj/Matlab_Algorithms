function [I,step] = IntSimpson(f,a,b,type,eps)
%type = 1 ����ɭ��ʽ
%type = 2 ����ɭ3/8��ʽ
%type = 3 ��������ɭ��ʽ

if(type==3 && nargin==4)
    eps=1.0e-4;                    %ȱʡ����Ϊ0.0001
end

I=0;
switch type
    case 1,
        I=((b-a)/6)*(subs(sym(f),findsym(sym(f)),a)+...
            4*subs(sym(f),findsym(sym(f)),(a+b)/2)+...
            subs(sym(f),findsym(sym(f)),b));
        step=1;
       
    case 2,
        I=((b-a)/8)*(subs(sym(f),findsym(sym(f)),a)+...
            3*subs(sym(f),findsym(sym(f)),(2*a+b)/3)+ ...
          3*subs(sym(f),findsym(sym(f)),(a+2*b)/3)+subs(sym(f),findsym(sym(f)),b)); 
        step=1;
        
    case 3,
        n=2;
        h=(b-a)/2;
        I1=0;
        I2=(subs(sym(f),findsym(sym(f)),a)+subs(sym(f),findsym(sym(f)),b))/h;
        while abs(I2-I1)>eps
            n=n+1;
            h=(b-a)/n;
            I1=I2;
            I2=0;
            for i=0:n-1
                x=a+h*i;
                x1=x+h;
                I2=I2+(h/6)*(subs(sym(f),findsym(sym(f)),x)+...
                    4*subs(sym(f),findsym(sym(f)),(x+x1)/2)+...
                    subs(sym(f),findsym(sym(f)),x1));
            end
        end
        I=I2;
        step=n;
end
       

