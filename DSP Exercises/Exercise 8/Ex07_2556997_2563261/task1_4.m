% Digital Signal Processing - Summer term 2018 (University of Saarland)
% Tutorial 7 - Task 1.4

% this code snippet make a call to the provided `mel' function

% HOW TO RUN:
% type the command `task1_4' into the console

% reinstanciate the environment
clear; close all;

% variables
fl       = 133.33334;
fh       = 6855.4976;
fft_size = 1024;
fs       = 16000;
L        = 24;
fmel     = 1125;

% generate the filterbank
filterbank = mel(fl, fh, fft_size, fs, L, fmel);

% plot the original waveform and the spectogram
figure(1)
imagesc(filterbank)
title('filterbank spectogram');