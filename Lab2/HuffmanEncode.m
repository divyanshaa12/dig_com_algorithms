function [encoded_text] = HuffmanEncode(file,code_book);

encoded_text = [];
for i=1:length(file)
    encoded_text = [encoded_text, code_book{find([code_book{:,1}]==file(i)),2}];
end

end

