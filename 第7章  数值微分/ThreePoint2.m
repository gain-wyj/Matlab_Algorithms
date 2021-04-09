function df= ThreePoint2(func,x0,type,h)
if nargin == 3 
    h = 0.1;
else if (nargin == 4 && h == 0.0)
        disp('h����Ϊ0��');
        return;
    end
end

for i=1:5
     y(i) = subs(sym(func), findsym(sym(func)), x0-2*h+i*h-h);
end
hd = 1/h/h;

switch type
    case 1,
        df = (y(3) - 2*y(4) + y(5))*hd;   %�õ�һ����ʽ����׵���
       
    case 2,
        df = (y(2) - 2*y(3) + y(4))*hd;          %�õڶ�����ʽ����׵���
        
    case 3,
        df = (y(1) - 2*y(2) + y(3))*hd;   %�õ�������ʽ����׵���
         
end
