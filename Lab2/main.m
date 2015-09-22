clc; clear; close all

fh = fopen('constitution.txt');

file = fread(fh);
fclose(fh);

alphabets = unique(file);
N = length(alphabets);
H = 0;

for i = 1:N
    p(i,1) = alphabets(i);
    p(i,2) = mean((file == alphabets(i)));
    H = H - p(i,2)*log2(p(i,2));
end

fprintf('Entropy of the source is %f \n',H)

code_book = HuffmanCode(p);

avg_len = 0;
for i = 1:length(code_book)
    avg_len = avg_len + code_book{i,3}*length(code_book{1,2});
end
avg_len
