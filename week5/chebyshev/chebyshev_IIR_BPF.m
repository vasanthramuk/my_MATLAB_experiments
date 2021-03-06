clc
clear variables

fsample = 4096;              %Should be atlease twice f to avoid aliasing



%Band Pass filter
fp = [500 700];        %in Hz
fs = [450 750];        %in Hz
as = 30;         %in dB
ap = 2;          %in dB

[n, fc] = cheb1ord(2*fp/fsample, 2*fs/fsample, ap, as);
%n is the order of digital Chebyshev filter
%fc is the cut-off freq of digital Chebyshev filter(lower and upper)
%multiplication by 2 is to normalize DT frequency from (0, pi) to (0,1)

[b, a] = cheby1(n, ap, fc);     %This is to find the transfer function
                                %co-efficients of the BPF
                                                      
freqz(b, a, fsample, fsample);  
title('Frequency Response of Chebyshev Band Pass Filter');  