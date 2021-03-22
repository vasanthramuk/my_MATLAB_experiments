%y[n] = cos[0.04*pi*n] ; -5 <= n <= 5

clc
clear all
n = [-50:50];
%yn=zeros(length(n));
for i = 1:length(n)
    yn(i) = cos(0.04*pi*n(i));
end

stem(n,yn);title("y[n] = cos[0.04*pi*n]");xlabel("n");ylabel("y[n]");
    