function [xq, SQNR]=MuLawQuantizer(x,n,mu)

for i =1:length(x)
    g(i) = sign(x(i))*(log(1 + mu*abs(x(i)))/log(1+mu));
end

[tmp,tmp1] = UniformQuantizer(g',n);

for i= 1:length(x)
    xq(i) = ((1+mu)^tmp(i) -1)*sign(tmp(i))/mu;
end

error = xq' - x;

SQNR = 20*log10(rms(x)/rms(error));

end