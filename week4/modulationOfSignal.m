clc 
clear variables

%%%%%%%%%%%%%%%%%Modulation and Demodultation%%%%%%%%%%%%%%%%%%%%%%%%%%%
fsig = 10;
fcar = 100;

fsamp = 512;                     %since fcar > fsig always

n = (0:fsamp-1);                    %time base
f = (0:fsamp-1);                    %frequency base

mn = cos(2*pi*fsig*n/fsamp);        %sampling of message signal
cn = cos(2*pi*fcar*n/fsamp);        %sampling of carrier signal

snDSBSC = mn.*cn;                      %This is the DSBSC signal
snAM = cn + mn.*cn;                    %This is the AM signal

Mf = fft(mn, fsamp); 
Cf = fft(cn, fsamp);

SfDSBSC = fft(snDSBSC, fsamp);
SfAM = fft(snAM, fsamp);

subplot(4,2,1);
stem(n, mn);xlabel('n');ylabel('m(n)');
title('message signal(time domain) - 10 Hz');

subplot(4,2,2);
stem(n, cn);xlabel('n');ylabel('c(n)');
title('carrier signal(time domain) - 100 Hz');

%Freq components of message and carrier
subplot(4,2,3);
stem(f, abs(Mf));xlabel('f');ylabel('abs(M(f))');
title('message signal(frequency domain) - 10 Hz');

subplot(4,2,4);
stem(f, abs(Cf));xlabel('f');ylabel('abs(C(f))');
title('carrier signal(frequency domain) - 100 Hz');

%Modulated signals in DSBSC and AM
subplot(4,2,5);
stem(n, snDSBSC);xlabel('n');ylabel('snDSBSC(n)');
title('DSBSC modulated signal(time domain)');

subplot(4,2,6);
stem(n, snAM);xlabel('n');ylabel('snAM(n)');
title('AM modulated signal(time domain)');


%Freq components of DSBSC modulated and AM modulated
subplot(4,2,7);
stem(f, abs(SfDSBSC));xlabel('f');ylabel('abs(SfDSBSC(f))');
title('DSBSC modulated signal(frequency domain)');

subplot(4,2,8);
stem(f, abs(SfAM));xlabel('f');ylabel('abs(SfAM(f))');
title('AM modulated signal(frequency domain)');