clc
clear variables

fsample = 4096;              %Should be atlease twice f to avoid aliasing

%Band Stop filter
fp = [450 750];        %in Hz
fs = [500 700];        %in Hz
as = 30;         %in dB
ap = 2;          %in dB

[n, fc] = buttord(2*fp/fsample, 2*fs/fsample, ap, as);
%n is the order of digital ButterWorth filter
%fc is the cut-off freq of digital ButterWorth filter(lower and upper)
%multiplication by 2 is to normalize DT frequency from (0, pi) to (0,1)

[b, a] = butter(n, fc,'stop');     %This is to find the transfer function
                                   %co-efficients of the BSF
                            
freqz(b, a, fsample, fsample);
title('Frequency Response of Butterworth Band Stop Filter');  