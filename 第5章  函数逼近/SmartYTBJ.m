function [node,err] = SmartYTBJ(func,a,b,y_s,y_e,maxtol)
format long;
node(1) = a;
node(2) = b;
num = 2;
if(b-a)<10 
    n = 5;
else
    n = 10;
end
err = 0;
bSign = 1;
while (bSign)
    bSign = 0;
    for l=1:num
        y(l) = subs(subs(sym(func), findsym(sym(func)),node(l)));
    end
    knode = node;
    tnum = num;
    insert_num = 0;
    for i=1:(tnum-1)
        pfx = ThrSample1(knode,y,y_s,y_e,((knode(i)+knode(i+1))/2));
        %��ʽ����ÿ���ֶ������ϵ�������ֵ����
        [mx,mv] = FindMX(func,pfx,knode(i),knode(i+1),n); 
        %�ҵ�����[knode(i),knode(i+1)]�ϵ�������ĵ�
        if mv > maxtol   
        %��������������ȣ��ڴ˵㽫����[knode(i),knode(i+1)]��Ϊ���Σ������˵��
        %����������
            d(1:(i+insert_num)) = node(1:(i+insert_num));
            d(i+insert_num+1) = mx; 
            num = num+1;
            d((i+insert_num+2):num) = node((i+insert_num+1):(num-1));   
            node = d;
            bSign = 1;  
            insert_num = insert_num + 1;
        else
            if(mv>err)
                err = mv;           %��¼����������ֵ�����ϵ�������
            end
        end
    end    
end
format short;

function [max_x,max_v] = FindMX(func,pfx,a,b,n)
format long;
eps = 1.e-3;
max_v = 0; 
max_x = a;
fa = subs(sym(func), findsym(sym(func)),a);   %��˵㺯��ֵ
fb = subs(sym(func), findsym(sym(func)),b);   %�Ҷ˵㺯��ֵ
step = n/5;
tol = 1;
tmp = 0;
while tol>eps
     t = a;
     for j=0:(n/step)       %��ѭ���ҳ�ȡ���ֵ��x
         t = a + j*step*(b-a)/n;
         pt = subs(sym(pfx), findsym(sym(pfx)),t); %������ֵ�ó��ĺ���ֵ
         ft = subs(sym(func), findsym(sym(func)),t);
         if abs(ft-pt)>max_v           %abs(f(x)-p(x))
            max_v = abs(ft-pt);       %��¼������
            max_x = t;                %��¼�˵�����
         end
     end   
     tol = abs(max_x-tmp);
     tmp = max_x;
     step = step/2;
end
format short;
