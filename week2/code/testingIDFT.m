clc
clear variables

Xk = input('Enter the sequence X(k): ');

numberOfPoints = input('Enter the number of points needed for IDFT: ');
Xk(length(Xk)+1 : numberOfPoints) = 0;
disp(Xk);


%Xk = [10, -2+2j, -2, -2-2j];%Feel free to change Xk to any point frequency
                             %points
                             
%This frequency samples for X(k)
k = [0 : length(Xk)-1];
    
subplot(2,2,1);
stem(k, real(Xk));xlabel('k');ylabel('real(X(k))');

subplot(2,2,2);
stem(k, imag(Xk));xlabel('k');ylabel('imag(X(k))');

%This is n for x[n]
n = k;             

%x[n] evaluated from findIDFT function defined in the same directory
xn = findIDFT(Xk);                                              

subplot(2,2,3);
stem(n,abs(xn));xlabel('n');ylabel('magnitude(x[n])');

subplot(2,2,4);
stem(n,angle(xn));xlabel('n');ylabel('angle(x[n])');

%sgtitle('Realization of IDFT');

disp(Xk);
disp(xn);