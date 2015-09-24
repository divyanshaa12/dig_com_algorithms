function [ out , code_tree ] = HuffmanCode( p )

% Huffman Code

prob = sortrows(p,2);

N = length(prob);
data = struct('node',[],'left',[],'right',[],'p',[],'alphabet',[],'code',[]); % Since huffman code follows a tree structure. I used a tree structure to form the code tree.

for i = 1:N % initialize all the leaf nodes.
    data(i).node = i;
    data(i).left = 0;
    data(i).right = 0;
    data(i).p = prob(i,2);
    data(i).alphabet = prob(i,1);
end

n = length(data);
for i = 1:N-1
    data(n+1).node = N+i;
    data(n+1).left = data(1);
    data(n+1).right = data(2);
    data(n+1).p = data(1).p + data(2).p; % take the least two probable leaves and assign a parent node to it.
    for j=1:n % Insert the parent node in the sorted list with respect to probablities.
        if data(j).p > data(n+1).p 
            data = [data(3:j-1),data(n+1),data(j:n)];
            break
        elseif data(n+1).p >= data(n).p
            data = [data(3:n),data(n+1)];
            break
        end
    end
    n = n-1;    
end

% basically data is now the head of tree. Now we need to form the code
% book.

code_book = [];
[data_out, code_book] = traverse(data,code_book); % traverse the tree in a dfs manner and assign the codeword.


% following code is just preparing the output.
tmp = struct2cell(code_book);
sz = size(tmp);

tmp = reshape(tmp,sz(1),[]);
tmp = tmp';
out = sortrows(tmp,1);
code_tree = data_out;
end

