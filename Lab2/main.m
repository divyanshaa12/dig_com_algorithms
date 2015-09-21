clc; clear; close all

fh = fopen('constitution.txt');
% file = char(fread(fh));
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

% p=[1,1/6;2,1/6;3,1/6;4,1/6;5,1/6;6,1/6];

fprintf('Entropy of the source is %f \n',H)

code_book = huffman(p);
