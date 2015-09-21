clc; clear; close all;
f_sig = 1000; % Tone frequency
fs = 10000; % Sampling frequency
Ts = 1/fs;
samp_time = 0.05; % sample 50ms of the waveform
for k = 1:samp_time/Ts 
    x(k) = 0.5*sin(2*pi*(k-1)*f_sig*Ts) + 0.5*cos(2*pi*(k-1)*(2*f_sig)*Ts);
end
[Xf,f] = CTFT(x,fs);
subplot(2,1,1)
plot(linspace(0,samp_time,samp_time*fs),x)
title('Time Domain Waveform')
xlabel('Time (s)')
ylabel('Amplitude')
grid on
grid minor
subplot(2,1,2)
plot (f,20*log10(abs(Xf)))
title('CTFT Plot')
xlabel('Frequency (Hz)')
ylabel('Amplitude (dB)')
grid on
grid minor
print('Task1','-depsc')
