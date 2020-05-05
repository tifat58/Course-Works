% Digital Signal Processing - Summer term 2018 (University of Saarland)
% Tutorial 7 - Task 1.2

% this code snippet implements the windowing function

% EXAMPLE USAGE:
% > [signal, Fs] = audioread('audio.au');
% > M = windowing(signal, 0, 64, 1);

% implement the `windowing' function
function [M] = windowing(s, shift, width, n)
    M = s((n-1)*shift+1:(n-1)*shift+width) .* hamming(width);
end