%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Ramp signal%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Signal Generation
clc
clear all
n = [-10:10];
for i = 1:length(n)
    if(n(i)>=0)
        xn(i)=n(i);
    else
        xn(i) = 0;
    end
end

%This is for plotting
stem(n,xn);
xlabel("n");
ylabel("r[n]");
title("Ramp signal");
