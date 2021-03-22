clc
clear variables

fsample = 4098;              %Should be atlease twice f to avoid aliasing

%High Pass filter
fs = 100;        %in Hz
fp = 1000;       %in Hz
as = 30;         %in dB
ap = 1;          %in dB

[n, fc] = buttord(2*fp/fsample, 2*fs/fsample, ap, as);
%n is the order of digital ButterWorth filter
%fc is the cut-off freq of digital ButterWorth filter
%multiplication by 2 is to normalize DT frequency from (0, pi) to (0,1)

[b, a] = butter(n, fc, 'high');     %This is to find the transfer function
                            %co-efficients of the LPF

freqz(b, a, fsample, fsample);
title('Frequency Response of Butterworth High Pass Filter');