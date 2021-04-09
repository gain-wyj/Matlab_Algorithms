function root=NewtonRoot(f,a,b,eps)
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

tol=1;
fun=diff(sym(f));                                 %����
fa=subs(sym(f),findsym(sym(f)),a);
fb=subs(sym(f),findsym(sym(f)),b);  
dfa=subs(sym(fun),findsym(sym(fun)),a);
dfb=subs(sym(fun),findsym(sym(fun)),b);
if(dfa>dfb)                                         %��ʼֵȡ���˵㵼���ϴ���
    root=a-fa/dfa;
else
    root=b-fb/dfb;
end
while(tol>eps)
    r1=root;
    fx=subs(sym(f),findsym(sym(f)),r1);
    dfx=subs(sym(fun),findsym(sym(fun)),r1);         %��õ�ĵ���ֵ
    root=r1-fx/dfx;                                          %�����ĺ��Ĺ�ʽ
    tol=abs(root-r1);
end

