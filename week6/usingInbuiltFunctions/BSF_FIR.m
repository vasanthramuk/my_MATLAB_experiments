clc;
clear variables;

fc = [200 300];
fsample = 1024;
M = 19;

[b, a] = fir1(M-1, 2*fc/fsample, 'stop', hanning(M));
freqz(b, a, fsample, fsample);
title('FIR BSF of order 19 with Hanning window');