function [decoded_file] = HuffmanDecode(encoded_text,code_tree)

% traverse the tree until you reach the node.

decoded_file = [];
next = code_tree;
for i = 1:length(encoded_text)
    if encoded_text(i) == '1' % traverse right if encoded bit is 1 else left
        next = next.right;
    else
        next = next.left;
    end
    if isequal(next.right,0) | isequal(next.left,0)
        decoded_file = [decoded_file;next.alphabet]; % append the alphabet of the leaf
        next = code_tree;
    end
end

end

