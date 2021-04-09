function kindX = DistgshAnalysis(XA,XB,SampX)
format long;
sz1 = size(XA);
sz2 = size(XB);
M = sz1(1);         %��������
N = sz2(1);
n = sz1(2);

meanXA = mean(XA);
meanXB = mean(XB);

sx = zeros(n,n);
Y = zeros(N,n);
for i=1:n
    for j=1:n
        sx(i,j) = dot(XA(:,i)-meanXA(i)*zeros(M,1),XA(:,j)-meanXA(j)*zeros(M,1))+ ...
              dot(XB(:,i)-meanXB(i)*zeros(N,1),XB(:,j)-meanXB(j)*zeros(N,1));
    end
end

d = transpose(meanXA - meanXB);
c = sx\d;

YA = dot(c,meanXA);
YB = dot(c,meanXB);
Yc =(M*YA + N*YB)/(M+N);
Y0 = dot(c,SampX);
if YA > YB
    if Y0 > Yc
        kindX = 1;
        disp('��Ʒ���ڵ�һ��');
    else
        if Y0 == Yc
            kindXp = 0 ;
            disp('û���ж�');
        else
            kindX = 2;
            disp('��Ʒ���ڵڶ���');
        end
    end
else
    if YA < YB
        if Y0 > Yc
            kindX = 2;
            disp('��Ʒ���ڵڶ���');
        else
            if Y0 == Yc
                kindX = 0 ;
                 disp('û���ж�');
            else
                kindX = 1;
                disp('��Ʒ���ڵ�һ��');
            end
        end
    else
         disp('û���ж�');
    end
end
