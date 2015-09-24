clc; clear; close all

fh = fopen('constitution.txt');
file = fread(fh);
fclose(fh);

alphabets = unique(file);  % find the number of unique source codes
N = length(alphabets);
H = 0;

for i = 1:N
    p(i,1) = alphabets(i);
    p(i,2) = mean((file == alphabets(i)));
    H = H - p(i,2)*log2(p(i,2)); % Entropy calculation
end 

fprintf('Entropy of the source is %f \n',H)

[code_book,code_tree] = HuffmanCode(p); % Form the code book for the given source

avg_len = 0;
for i = 1:length(code_book)
    avg_len = avg_len + code_book{i,3}*length(code_book{i,2}); % average code lenght per symbol calcultion.
end

fprintf('Average length per Symbol of the huffman code is %f \n',avg_len)

encoded_text = HuffmanEncode(file,code_book); % encode the file with the codebook

decoded_file = HuffmanDecode(encoded_text,code_tree); % decode the coded file.

if isequal(decoded_file,file) % checks if the input and decoded file matches
    fprintf('Original and the Decoded file matches \n')
else
    fprintf('Original and the Decoded file does not match \n')
end

fh = fopen('constitution_out.txt','w');
file = fwrite(fh,decoded_file); % writes the decoded file to txt file
fclose(fh);