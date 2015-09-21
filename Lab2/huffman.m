function [ out ] = huffman( p )

% Huffman Code

prob = sortrows(p,2);

N = length(prob);
data = struct('node',[],'left',[],'right',[],'p',[],'alphabet',[],'code',[]);

for i = 1:N
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
    data(n+1).p = data(1).p + data(2).p;
    for j=1:n
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

code_book = [];
[data_out, code_book] = traverse(data,code_book);

out = code_book;
% for i = 1: length(code_book)
%     tmp(i,1) = code_book(i).alphabet;
%     tmp(i,2) = bin2dec(code_book(i).code);
% end
% 
% tmp = sortrows(tmp);
% 
% out = [p,tmp(:,2)];

end

