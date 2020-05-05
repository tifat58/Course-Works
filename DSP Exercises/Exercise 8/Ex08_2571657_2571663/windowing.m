
function [M] = windowing(s, shift, width, n)
    M = s((n-1)*shift+1:(n-1)*shift+width) .* hamming(width);
end
