clc
clear variables

f = 200;
fsample = 4096;              %Should be atlease twice f to avoid aliasing
n = (0:1/fsample:1);
xn = cos(2*pi*f*n);


%Low Pass filter
fs = 550;        %in Hz
fp = 500;        %in Hz
as = 30;         %in dB
ap = 0.01;          %in dB

[n, fc] = cheb1ord(2*fp/fsample, 2*fs/fsample, ap, as);
%n is the order of digital ButterWorth filter
%fc is the cut-off freq of digital ButterWorth filter
%multiplication by 2 is to normalize DT frequency from (0, pi) to (0,1)

[b, a] = cheby1(n,ap, fc);     %This is to find the transfer function
                            %co-efficients of the LPF
                            
freqz(b, a, fsample, fsample);
title('Frequency Response of Chebyshev Low Pass Filter');