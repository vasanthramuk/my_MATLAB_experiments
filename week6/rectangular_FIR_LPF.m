clc;
clear variables;

fc = 100;
fsample = 2048;
M = 40;
wc = (2*pi*fc)/fsample;  % Cutoff frequency in radians per second

%% rectangular window
h_a = [];
for n=0:M-1
  	alpha = (M-1)/2;
    if(n==alpha)
        h_a(n+1)=wc/pi;
    else
        h_a(n+1)=sin((n-alpha)*wc)/((n-alpha)*pi);
    end
end

w_n = [];
for n=0:M-1
    w_n(n+1)=1;
end

h_n = h_a.*w_n;

figure(1);
[H, w] = freqz(h_n);
plot(fsample*w/(2*pi),20*log10(abs(H)));
xlabel('Frequency (Hertz)');ylabel('Magnitude (dB)');
title('FIR LPF - Rectangular window');

figure(2);
[b,a] = fir1(M-1,2*fc/fsample,'low',rectwin(M));
freqz(b,a,fsample,fsample);
title('For checking: FIR LPF - Rectangular window');