clc; clear; close all;
load('recording.mat');
x = getaudiodata(voice_sample);
fs = 24000;
Ts = 1/fs;
samp_time = 5;
[Xf,f] = CTFT(x,fs);
figure;
subplot(2,1,1)
plot(linspace(0,samp_time,samp_time/Ts),x)
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
print('Task2_original','-depsc')

% Downsample by 2
DS_factor = 2;
N = length(x);
for i = 1:N/DS_factor
    x_ds(i) = x(DS_factor * i);
end
[Xf_ds,f_ds] = CTFT(x_ds,fs/DS_factor);
figure;
subplot(2,1,1)
plot(linspace(0,samp_time,samp_time/(DS_factor*Ts)),x_ds)
title('Time Domain Waveform')
xlabel('Time (s)')
ylabel('Amplitude')
grid on
grid minor
subplot(2,1,2)
plot (f_ds,20*log10(abs(Xf_ds)))
title('CTFT Plot')
xlabel('Frequency (Hz)')
ylabel('Amplitude (dB)')
grid on
grid minor
print('Task2_DS2','-depsc')

% Downsample by 8
DS_factor = 8;
N = length(x);
for i = 1:N/DS_factor
    x_ds8(i) = x(DS_factor * i);
end
[Xf_ds8,f_ds8] = CTFT(x_ds8,fs/DS_factor);
figure;
subplot(2,1,1)
plot(linspace(0,samp_time,samp_time/(DS_factor*Ts)),x_ds8)
title('Time Domain Waveform')
xlabel('Time (s)')
ylabel('Amplitude')
grid on
grid minor
subplot(2,1,2)
plot (f_ds8,20*log10(abs(Xf_ds8)))
title('CTFT Plot')
xlabel('Frequency (Hz)')
ylabel('Amplitude (dB)')
grid on
grid minor
print('Task2_DS8','-depsc')
