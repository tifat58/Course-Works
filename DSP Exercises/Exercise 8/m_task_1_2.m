
clear;
close all;

[Y, Fs] = audioread('point8.au');
Y = sum(Y,2);
% apply the pre-emphasis filter
filtered_Y = filter([1, 0.95], 1, Y);