clc;
clear variables;

%%Band Pass Filter
fc= [100 1000];
fsample = 2048;
M = 50;

[b,a] = fir1(M-1,2*fc/fsample,"bandpass",blackman(M));
freqz(b,a,fsample,fsample);
title("Band Pass Filter of order 50(blackman window)");