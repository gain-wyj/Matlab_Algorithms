function root=DblSecant(f,a,b,eps)
if(nargin==3)
    eps=1.0e-4;
end

f1=subs(sym(f),findsym(sym(f)),a);
f2=subs(sym(f),findsym(sym(f)),b);
if(f1==0)
    root=a;
end
if(f2==0)
    root=b;
end

if(f1*f2>0)
    disp('���˵㺯��ֵ�˻�����0!');
    return;
else
    tol=1;
    root=b;
    r2=a;                         %������ʼֵ
    while(tol>eps)
        n = n+1;
        r1 = r2;
        r2 = root;
        f1=subs(sym(f),findsym(sym(f)),r1);
        f2=subs(sym(f),findsym(sym(f)),r2);
        if(f1==0)
            root=r1;
        else
            if(f2==0)
                root = r2;
            else
                root=r2-(r2-r1)*f2/(f2-f1);               
            end
        end
        tol=abs(root-r2);
    end
end