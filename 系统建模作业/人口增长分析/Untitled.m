%求解可达矩阵
n=12;
A=[0 0 0 0 0 0 0 0 0 0 1 0;
   1 0 1 0 0 0 0 0 0 0 0 0;
   0 0 0 0 0 0 0 0 0 1 0 0;
   0 0 0 0 1 0 0 0 0 1 0 0;
   0 0 0 1 0 0 0 0 0 0 0 0;
   1 0 1 0 0 0 0 0 0 0 0 0;
   1 0 0 0 0 0 0 0 0 0 0 0;
   1 0 1 1 0 0 0 0 0 0 0 0;
   0 0 0 1 0 0 0 0 0 0 0 0;
   0 0 0 0 0 0 0 0 0 0 0 1;
   0 0 0 0 0 0 0 0 0 0 0 1;
   0 0 0 0 0 0 0 0 0 0 0 0;
   ];
E=eye(n);
R=A+E;
k=0;
while 1
    Rnew=R*(A+E)>0;
    if isequal (R,Rnew);
        k=k+1;
     break;
    end
    R=Rnew;
    k=k+1;
end
disp(Rnew);
A=Rnew;
A
 % 实现级别划分
 r=1;
 M=zeros(n);
 while(~isequal(A,M))
%实现区域划分
for i=1:n
    P=find(A(i,:));
    Q=find(A(:,i));
    S=intersect(P,Q);
     if(~isempty(P)&&~isempty(Q)&&(length(P)==length(S)))
         disp('第r级：')
         r
         disp('元素为')
         i
         A(i,i)=0;
     end
end
     for i=1:n
         if A(i,i)==0
             A(i,:)=0;
             A(:,i)=0;
         end
     end
     r=r+1;
 end
     
     