function [decoded_file] = HuffmanDecode(encoded_text,code_tree)

decoded_file = [];
next = code_tree;
for i = 1:length(encoded_text)
    if encoded_text(i) == '1'
        next = next.right;
    else
        next = next.left;
    end
    if isequal(next.right,0) | isequal(next.left,0)
        decoded_file = [decoded_file;next.alphabet];
        next = code_tree;
    end
end

end

