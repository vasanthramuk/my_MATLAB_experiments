clc
clear variables


xn = input('Enter the sequence x[n]: ');
hn = input('Enter the sequence h[n]: ');

%xn = [1 2 3 4];
%hn = [1 2 3 4];

%This is for making both x[n] and h[n] equally sized
xnLength = length(xn);
hnLength = length(hn);

if xnLength > hnLength
        hn = [hn, zeros(1,xnLength - hnLength)];
elseif hnLength > xnLength
        xn = [xn, zeros(1, hnLength - xnLength)];
end

%This converts x[n] and h[n] into column matrix
xn = xn';
hn = hn';

xnLength = length(xn);
hnLength = length(hn);

%for finding h matrix
hMat = zeros(hnLength);

for i=0:hnLength-1
    hMat(1:hnLength, i+1) = circshift(hn,i);
end

yn = hMat*xn;

n = (0:xnLength-1);

subplot(3,2,1);
stem(n,real(xn'));xlabel('n');ylabel('real(x[n])');

subplot(3,2,2);
stem(n,imag(xn'));xlabel('n');ylabel('imag(x[n])');


subplot(3,2,3);
stem(n,real(hn'));xlabel('n');ylabel('real(h[n])');

subplot(3,2,4);
stem(n,imag(hn'));xlabel('n');ylabel('imag(h[n])');

subplot(3,2,5);
stem(n,real(yn'));xlabel('n');ylabel('real(y[n])');

subplot(3,2,6);
stem(n,imag(yn'));xlabel('n');ylabel('imag(y[n])');

disp(yn);