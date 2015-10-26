clc;clear;close all;

sp0 = audioread('speech0.wav');   
sp1 = audioread('speech1.wav');  
sp2 = audioread('speech2.wav');  
sp3 = audioread('speech3.wav');

for i = 1:8
    [sp0_q(i,:), sqnr_sp0(i)]= UniformQuantizer(sp0,i);
end

mos_sp0 = zeros(1,8);
mos_sp0(8) = 4;
mos_sp0(7) = 4;
mos_sp0(6) = 3;
mos_sp0(5) = 3;
mos_sp0(4) = 2;
mos_sp0(3) = 2;
mos_sp0(2) = 1;
mos_sp0(1) = 1;

subplot(2,1,1)
plot(1:8,sqnr_sp0)
title('SQNR vs Quantization Levels')
xlabel('Number of Levels')
ylabel('SQNR(dB)')
grid on
grid minor

subplot(2,1,2)
plot(1:8,mos_sp0)
title('MOS vs Quantization Levels')
xlabel('Number of Levels')
ylabel('MOS')
grid on
grid minor

print('Task1','-depsc')

%% Task 2
clc;clear;close all;

sp0 = audioread('speech0.wav');   
sp1 = audioread('speech1.wav');  
sp2 = audioread('speech2.wav');  
sp3 = audioread('speech3.wav');

for i = 1:8
    [sp1_q(i,:), sqnr_sp1(i)]= MuLawQuantizer(sp1,i,255);
end

mos_sp1 = zeros(1,8);
mos_sp1(8) = 5;
mos_sp1(7) = 5;
mos_sp1(6) = 5;
mos_sp1(5) = 5;
mos_sp1(4) = 4;
mos_sp1(3) = 4;
mos_sp1(2) = 3;
mos_sp1(1) = 1;

subplot(2,1,1)
plot(1:8,sqnr_sp1)
title('SQNR vs Quantization Levels')
xlabel('Number of Levels')
ylabel('SQNR(dB)')
grid on
grid minor

subplot(2,1,2)
plot(1:8,mos_sp1)
title('MOS vs Quantization Levels')
xlabel('Number of Levels')
ylabel('MOS')
grid on
grid minor

print('Task2','-depsc')

%% Task 3
clc;clear;close all;

[sp0,fs] = audioread('speech0.wav');   
sp1 = audioread('speech1.wav');  
sp2 = audioread('speech2.wav');  
sp3 = audioread('speech3.wav');

%%Testing
% dx = 1/1000;
% upsamp_rate = 4000; % in Hz
% du = 1/upsamp_rate;
% 
% t = linspace(0,1,1000);
% x = sin(2*pi*200*t);
% xu = UpDownSample(x,dx,du);

dx = 1/fs;
upsamp_rate = 16000; % in Hz
du = 1/upsamp_rate;

sp1_up = UpDownSample(sp1,dx,du);
