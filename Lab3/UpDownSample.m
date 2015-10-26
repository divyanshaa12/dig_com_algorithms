function xu = UpDownSample(x,dx,du)

N = length(x);
rho = dx/du;

M = floor(N*rho);


for i = 1:(M-rho)
    tmp1 = x(floor(i/rho) + 1);
    tmp2 = x(ceil(i/rho) + 1);
    
    xu(i) = tmp1 + ((tmp2 - tmp1)*(i/rho - floor(i/rho)));
end
xu = xu';
% xu = xu/max(xu);

plot(abs(fftshift(fft(xu))))
figure
plot(abs(fftshift(fft(x))))

end

