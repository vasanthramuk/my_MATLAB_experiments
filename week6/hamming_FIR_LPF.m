clc;
clear variables;

fc = 100;
fsample = 2048;
M = 40;
wc = (2*pi*fc)/fsample;  % Cutoff frequency in radians per second

%% hamming window
h_a = [];
for n=0:M-1
    alpha = (M-1)/2;
    if(n==alpha)
        h_a(n+1)=wc/pi;
    else
        h_a(n+1)=sin((n-alpha)*wc)/((n-alpha)*pi);
    end
end

w_n = 0.54-0.46*cos(2*pi*(0:M-1)/(M-1));

for n=0:M-1
    h_n(n+1) = round(h_a(n+1)*w_n(n+1),4);
end

figure(1);
[H, w] = freqz(h_n);
plot(fsample*w/(2*pi),20*log10(abs(H)));
xlabel('Frequency (Hertz)');ylabel('Magnitude (dB)');
title('FIR LPF - Hamming window');

figure(2);
[b,a] = fir1(M-1,2*fc/fsample,'low',hamming(M));
freqz(b,a,fsample,fsample);
title('For checking: FIR LPF - Hamming window');