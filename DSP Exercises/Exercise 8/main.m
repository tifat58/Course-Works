
clear;
close all;

% Task 1.2 
[Y, Fs] = audioread('point8.au');
Y = sum(Y,2);
% applying the pre-emphasis filter
filtered_Y = filter([1, 0.95], 1, Y);

% Task 1.3
% windowing function is implemented in windowming.m function file


% Task 1.4
fl = 133.33334;
fh = 6855.4976;
fft_size = 1024;
fs = 16000;
L = 24;
fmel = 1125;

% generating the filterbank by calling mel function
filterbank = mel(fl, fh, fft_size, fs, L, fmel);

% Plotting Filterblank
figure(1)
imagesc(filterbank)
title('Filterbank Spectogram');

% Task 1.5
shift = round(0.010 * Fs);
width = round(0.025 * Fs);
n     = ceil((length(filtered_Y) - width - shift) / shift);
nfft  = 2^ceil(log2(width));
spec  = zeros(nfft, n);

% generating the spectogram

for i = 1:1:n
    spec(:, i) = abs(fft(windowing(filtered_Y, shift, width, i), nfft));
end

fl       = 133.33334;
fh       = 6855.4976;
fft_size = nfft * 2;
fs       = Fs;
L        = width;
fmel     = 1125;

% generating the filterbank
filterbank = mel(fl, fh, fft_size, fs, L, fmel);

% multiply the result with the filterbank
res = filterbank * spec;

% plot the original waveform and the MFCC
x_space = linspace(0, length(Y) - 1, length(Y)) ./ Fs;
figure(2)
subplot(2, 1, 1)
plot(x_space, Y)
xlabel('time (s)')
title('original audiostream')
subplot(2, 1, 2)
imagesc(res)
title('MFCC spectogram');