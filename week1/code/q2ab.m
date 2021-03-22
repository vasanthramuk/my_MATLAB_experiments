%%%%%%%%%%%%%%%%%%%%%%%question 3%%%%%%%%%%%%%%%%%%%%%%%
%2. If x[n] = {1 2 3 4 5 6 7 6 5 4 3 2 1}

%a. X1[n] = 2x[n-5] - 3x[n+4]
%b. x2[n] = x[3-n] - x[n]x[n-2]
clc
clear variables
xn = [1, 2, 3, 4 ,5, 6, 7, 6, 5, 4, 3, 2, 1];

xnSize = length(xn);
xntemp(1:6) = 0;                     %Change 10 to any other number 
                                     %if full signal is not visibles
sizeOfHalf = length(xn) + length(xntemp);
xn = [xntemp, xn*0, xn, xntemp];     %Since we are shifting,
                                     %let's add few extra 0s to x[n]
                                     %Creating symmetrical sampling
                                     %points
n = [-(length(xntemp)+xnSize) : (length(xntemp)+xnSize-1)];



%x[n-5] 
for i=1:length(n)
    if(i <= 5)
        xnm5(i) = 0;
    else
        xnm5(i) = xn(i-5);
    end
end

%x[n+4]
for i= 1:length(n)
    if(i >= length(xn)-4 )
        xnp4(i) = 0;
    else
        xnp4(i) = xn(i+4);
    end
end    
    
%a. X1[n] = 2x[n-5] - 3x[n+4]
sgtitle("X1[n] = 2x[n-5] - 3x[n+4]   ;   X2[n] = x[3-n] - x[n]x[n-2]");
X1n = 2*xnm5 - 3*xnp4

subplot(3,3,1); stem(n,xn);
xlabel("n");ylabel("x[n]");title("x[n]");

subplot(3,3,2); stem(n,xnm5);
xlabel("n");ylabel("x[n-5]");title("x[n-5]");

subplot(3,3,3); stem(n,xnp4);
xlabel("n");ylabel("x[n+4]");title("x[n+4]");

subplot(3,3,4); stem(n,X1n);
xlabel("n");ylabel("X1[n]");title("X1[n] = 2x[n-5]-3x[n+4]");


%x[n-2] 
for i=1:length(n)
    if(i <= 2)
        xnm2(i) = 0;
    else
        xnm2(i) = xn(i-2);
    end
end

%x[-n]
%The index n=0 is length(xntemp)+xnSize+1
indexOfZero = sizeOfHalf+1;
xrev = xn;
for i=1:xnSize
    temp = xrev(indexOfZero+i);
    xrev(indexOfZero+i) = xrev(indexOfZero-i);
    xrev(indexOfZero-i)=temp;
end

%x[3-n] = x[-n+3]
for i=1:length(xrev)
    if(i>=length(xrev)-3)
        x3mn(i)=0;
    else
        x3mn(i)=xrev(i+3);
    end
end
%b. x2[n] = x[3-n] - x[n]x[n-2]
X2n = x3mn - xn.*xnm2;

subplot(3,3,7); stem(n,x3mn);
xlabel("n");ylabel("x[3-n]");title("x[3-n]");

subplot(3,3,8); stem(n,xn.*xnm2);
xlabel("n");ylabel("x[n]x[n-2]");title("x[n]x[n-2]");

subplot(3,3,9); stem(n,X2n);
xlabel("n");ylabel("X2[n]");title("X2[n] = x[3-n]-x[n]x[n-2]");