% Digital Signal Processing - Summer term 2018 (University of Saarland)
% Tutorial 7 - Task 1.3

% this code snippet tests the implementations of the
% first two subtasks

% HOW TO RUN:
% type the command `task1_3' into the console

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

% plot the original waveform and the spectogram
x_space = linspace(0, length(s_point8) - 1, length(s_point8)) ./ f_point8;
figure(1)
subplot(2, 1, 1)
plot(x_space, s_point8)
xlabel('time (s)')
title('original audiostream')
subplot(2, 1, 2)
imagesc(spec)
title('windowing spectogram');