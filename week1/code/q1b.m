%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Unit step signal%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Signal Generation
clc
clear all
n = [-10:10];
for i=1:length(n)
    if(n(i) >= 0)
        xn(i)=1;
    else
        xn(i)=0;
    end
end

%This is for plotting
stem(n,xn);
xlabel("n");
ylabel("u[n]");
title("Unit step signal");
