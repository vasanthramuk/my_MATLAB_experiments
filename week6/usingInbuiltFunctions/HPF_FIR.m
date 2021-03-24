clc;
clear variables;

fc = 200;
fsample = 2048;
M = 29;             %This should be odd for HPF and BSF

[b,a] = fir1(M-1,2*fc/fsample,'high',hamming(M)); 
freqz(b, a, fsample, fsample);
title('FIR HPF of order 29 with Hamming window');