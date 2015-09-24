function [node,book] = traverse( node,book )

if isequal(node.right,0) | isequal(node.left,0) % this means you've reached the leaf
    tmp.alphabet = node.alphabet;
    tmp.code = node.code;
    tmp.p = node.p;
    book = [book,tmp]; % add the code to the codebook.
    return
else
    node.right.code = [node.code,'1']; % assign 1 to right node
    node.left.code = [node.code,'0']; % assign 0 to right node
    [node.right,book] = traverse(node.right,book); % recursively call for dfs
    [node.left,book] = traverse(node.left,book);
end

end

