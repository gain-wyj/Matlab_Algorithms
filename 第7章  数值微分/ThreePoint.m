function df=ThreePoint(func,x0,type,h)
if nargin == 3 
    h = 0.1;
else if (nargin == 4 && h == 0.0)
        disp('h����Ϊ0��');
        return;
    end
end

y0 = subs(sym(func), findsym(sym(func)),x0);  
y1 = subs(sym(func), findsym(sym(func)),x0+h);
y2 = subs(sym(func), findsym(sym(func)),x0+2*h);
y_1 = subs(sym(func), findsym(sym(func)),x0-h);
y_2 = subs(sym(func), findsym(sym(func)),x0-2*h);

switch type
    case 1,
        df = (-3*y0+4*y1-y2)/(2*h);     %�õ�һ����ʽ����
       
    case 2,
        df = (3*y0-4*y_1+y_2)/(2*h);   %�õڶ�����ʽ����
      
    case 3,
        df = (y1-y_1)/(2*h);             %�õ�������ʽ����
      
end
        