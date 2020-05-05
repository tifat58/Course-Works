% Digital Signal Processing - Summer term 2018 (University of Saarland)
% Tutorial 7 - Task 1.5

% this code snippet tests all the implementations
% of the previous subtasks

% HOW TO RUN:
% type the command `task1_5' into the console

% reinstanciate the environment
clear; close all;

% execute task 1.1
task1_1;

% variables
shift = round(0.010 * f_point8);
width = round(0.025 * f_point8);
n     = ceil((length(filtered_point8) - width - shift) / shift);
nfft  = 2^ceil(log2(width));
spec  = zeros(nfft, n);

% generate the spectogram
for i = 1:1:n
    spec(:, i) = abs(fft(windowing(filtered_point8, shift, width, i), nfft));
end

% variables
fl       = 133.33334;
fh       = 6855.4976;
fft_size = nfft * 2;
fs       = f_point8;
L        = width;
fmel     = 1125;

% generate the filterbank
filterbank = mel(fl, fh, fft_size, fs, L, fmel);

% multiply the result with the filterbank
res = filterbank * spec;

% plot the original waveform and the spectogram
x_space = linspace(0, length(s_point8) - 1, length(s_point8)) ./ f_point8;
figure(1)
subplot(3, 1, 1)
plot(x_space, s_point8)
xlabel('time (s)')
title('original audiostream')
subplot(3, 1, 2)
imagesc(spec)
title('windowing spectogram')
subplot(3, 1, 3)
imagesc(res)
title('filterbank spectogram');