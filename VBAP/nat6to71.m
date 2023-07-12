function y=nat6to71(x)
v=[2,8,6,5,7,1];
[n,m]=size(x);
y=zeros(n,m+2);
y(:,v)=x;