clc
clear variables

%xt = cos(2*pi*f*t)
f = 500;            %frequency of the single tone signal

%Sampled signal generation
fs = 1024;               %Sampling frequency(should be >= 2*f)
n = (0 : fs-1);         %Displaying xn
xn = cos(2*pi*f*n/fs);  %This is the sampled version of xt
subplot(1,2,1); stem(n, xn);
xlabel('n'); ylabel('xn');
title('x(n) - 500 Hz');

f = (0:1:fs-1);
Xf = fft(xn,fs);
subplot(1,2,2); stem(f, abs(Xf));
xlabel('f'); ylabel('X(f)');        %Gives spectrum of spectrum of x[n]
title('X(f) - 500 Hz');                      %Normalizing against fs corrected
                                    
