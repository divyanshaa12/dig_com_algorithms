function [xq, SQNR]= UniformQuantizer(x,n)

delta = 2/(2^n - 1);

for i=1:length(x)
    for j = -1:delta:1
        if (x(i) >= (j - delta/2)) && (x(i) < (j + delta/2))
            xq(i) = j;
        end
    end
end

xq = xq';
error = x - xq;

SQNR = 20*log10(rms(x)/rms(error));

end