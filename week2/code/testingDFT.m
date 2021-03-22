clc
clear variables
xn = input('Enter the sequence x[n]: ');

numberOfPoints = input('Enter the number of points needed for DFT(>= length(xn)): ');
%xn = [1, 2, 3, 4];           %Feel free to change xn to any point sequence


%assuming numberOfPoints >= length(xn)
xn(length(xn)+1 : numberOfPoints) = 0;

%This time samples for x(n)
n = [0:length(xn)-1];
    
subplot(2,2,1);
stem(n,real(xn));xlabel('n');ylabel('real(x[n])');

subplot(2,2,2);
stem(n,imag(xn));xlabel('n');ylabel('imag(x[n])');

%This is k for X(k)
k = n;                                                             
%X(k) evaluated from findDFT function defined in the same directory
Xk = findDFT(xn);                                              

subplot(2,2,3);
stem(k,abs(Xk));xlabel('k');ylabel('magnitude(X(k))');

subplot(2,2,4);
stem(k,angle(Xk));xlabel('k');ylabel('phase(X(k))');

sgtitle('Realization of DFT');

disp(xn);
disp(Xk);