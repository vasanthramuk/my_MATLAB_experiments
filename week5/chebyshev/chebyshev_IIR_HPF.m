clc
clear variables

fsample = 4098;              %Should be atlease twice f to avoid aliasing

%High Pass filter
fs = 980;        %in Hz
fp = 1000;       %in Hz
as = 30;         %in dB
ap = 1;          %in dB

[n, fc] = cheb1ord(2*fp/fsample, 2*fs/fsample, ap, as);
%n is the order of digital cheby1Worth filter
%fc is the cut-off freq of digital cheby1Worth filter
%multiplication by 2 is to normalize DT frequency from (0, pi) to (0,1)

[b, a] = cheby1(n, ap, fc, 'high');     %This is to find the transfer function
                                    %co-efficients of the LPF
                            
freqz(b, a, fsample, fsample);
title('Frequency Response of Chebyshev High Pass Filter');