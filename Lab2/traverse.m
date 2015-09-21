function [node,book] = traverse( node,book )

if isequal(node.right,0) | isequal(node.left,0)
    tmp.alphabet = node.alphabet;
    tmp.code = node.code;
    book = [book,tmp];
    return
else
    node.right.code = [node.code,'1'];
    node.left.code = [node.code,'0'];
    [node.right,book] = traverse(node.right,book);
    [node.left,book] = traverse(node.left,book);
end

end

