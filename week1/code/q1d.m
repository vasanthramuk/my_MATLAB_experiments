%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%question 2%%%%%%%%%%%%%%%%%
%y[n]=2*del[n-1]-4*del[n+2]; -5<= n <= 5

clc
clear all
n = [-5:5];


for i=1:length(n)
    if(n(i)==1)
        delnm1(i) = 1;
    else
        delnm1(i) = 0;
    end
end   


for i=1:length(n)
    if(n(i)==-2)
        delnp2(i) = 1;
    else
        delnp2(i) = 0;
    end
end   

yn = 2*delnm1 - 4*delnp2;

subplot(2,2,1); stem(n,delnm1);
xlabel("n");ylabel("del[n-1]");title("del[n-1]");

subplot(2,2,2); stem(n,delnp2);
title("del[n+2]");xlabel("n");ylabel("del[n+2]");

subplot(2,2,3); stem(n,yn);
title("yn = 2*del[n-1]-4*del[n+2]");xlabel("n");ylabel("y[n]");