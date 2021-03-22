%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Impulse signal%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Signal Generation

clc
clear all
n = [-10:10];
for i=1:length(n)
    if(n(i)==0)
        xn(i) = 1;
    else
        xn(i) = 0;
    end
end

%This is for plotting
subplot(2,2,1); stem(n,xn);
xlabel('n');
ylabel('del[n]');
title('Unit impulse signal');