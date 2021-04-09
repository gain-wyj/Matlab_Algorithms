function q = IntGauss(f,a,b,n,AK,XK)
%����������f��
%����������˵㣺a��
%���������Ҷ˵㣺b��
%�����õĸ�˹���ֵ������n��
%�Զ���ϵ����AK
%�Զ�����ֵ㣺XK��
%����ֵ��q��

if(n<5 && nargin == 4)
    AK = 0;
    XK = 0;
else
    if  n>5                                              %���n>4����ڵ��ϵ���ɵ����߸���
        XK1=((b-a)/2)*XK+((a+b)/2);
        q=((b-a)/2)*sum(AK.*subs(sym(f),findsym(f),XK1));
    end
end

ta = (b-a)/2;
tb = (a+b)/2;
 

switch n
    case 1, %n��1ʱ�����ñ�6-1�ж�Ӧ��ϵ�� �� ���м���
        q=2*ta*subs(sym(f),findsym(sym(f)),tb);
        
    case 2, %n��2ʱ�����ñ�6-1�ж�Ӧ��ϵ�� �� ���м���
        q=ta*(subs(sym(f),findsym(sym(f)),ta*0.5773503+tb)+...
            subs(sym(f),findsym(sym(f)),-ta*0.5773503+tb));
        
    case 3, %n��3ʱ�����ñ�6-1�ж�Ӧ��ϵ�� �� ���м���
        q=ta*(0.55555556*subs(sym(f),findsym(sym(f)),ta*0.7745967+tb)+...
            0.55555556*subs(sym(f),findsym(sym(f)),-ta*0.7745967+tb)+...
            0.88888889*subs(sym(f),findsym(sym(f)),tb));
           
    case 4, %n��4ʱ�����ñ�6-1�ж�Ӧ��ϵ�� �� ���м���
        q=ta*(0.3478548*subs(sym(f),findsym(sym(f)),ta*0.8611363+tb)+...
            0.3478548*subs(sym(f),findsym(sym(f)),-ta*0.8611363+tb)+...
            0.6521452*subs(sym(f),findsym(sym(f)),ta*0.3398810+tb)...
            +0.6521452*subs(sym(f),findsym(sym(f)),-ta*0.3398810+tb));
   case 5,  %n��5ʱ�����ñ�6-1�ж�Ӧ��ϵ�� �� ���м���
        q=ta*(0.2369269*subs(sym(f),findsym(sym(f)),ta*0.9061793+tb)+...
            0.2369269*subs(sym(f),findsym(sym(f)),-ta*0.9061793+tb)+...
            0.4786287*subs(sym(f),findsym(sym(f)),ta*0.5384693+tb)...
            +0.4786287*subs(sym(f),findsym(sym(f)),-ta*0.5384693+tb)+...
            0.5688889*subs(sym(f),findsym(sym(f)),tb));
end
