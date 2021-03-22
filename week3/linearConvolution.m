clc
clear variables

xn = input('Enter the sequence x[n]: ');
hn = input('Enter the sequence h[n]: ');


% xn = [1 2 3];
% hn = [1 2 3];

%This is for making both x[n] and h[n] equally sized
xnLength = length(xn);
hnLength = length(hn);
pointsToEliminateAlias = xnLength+hnLength-1;

hn = [hn, zeros(1, pointsToEliminateAlias - hnLength)];
xn = [xn, zeros(1, pointsToEliminateAlias - xnLength)];
n  = (0 : pointsToEliminateAlias -1);

% Hence we have to perform N1+N2-1 point DFT of x(n) and h(n)
% Find the product of X(k) and H(k) [again N1+N2-1 points]
% Then find N1+N2-1 IDFT of the result from previous step

Xk = findDFT(xn);
Hk = findDFT(hn);

Rk = Xk .* Hk;

yn = findIDFT(Rk);

subplot(3,2,1);
stem(n,real(xn));xlabel('n');ylabel('real(x[n])');

subplot(3,2,2);
stem(n,imag(xn));xlabel('n');ylabel('imag(x[n])');


subplot(3,2,3);
stem(n,real(hn));xlabel('n');ylabel('real(h[n])');

subplot(3,2,4);
stem(n,imag(hn));xlabel('n');ylabel('imag(h[n])');

subplot(3,2,5);
stem(n,real(yn));xlabel('n');ylabel('real(y[n])');

subplot(3,2,6);
stem(n,imag(yn));xlabel('n');ylabel('imag(y[n])');

disp(yn);


