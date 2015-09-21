function [ Xf, f ] = CTFT( x,fs )
% Takes the time domain signal x sampled at fs and returns the CTFT(approximation/sampled version) signal. 
Xf = fftshift(fft(x));
N = length(Xf);
f = linspace(-N/2,N/2 - 1, N) *fs/N;
end

