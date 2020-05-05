
clear;
close all;

% execute task 1.1
m_task_1_2;
% variables
shift = round(0.010 * Fs);
width = round(0.025 * Fs);
n     = ceil((length(filtered_Y) - width - shift) / shift);
nfft  = 2^ceil(log2(width));
spec  = zeros(nfft, n);

% generate the spectogram

for i = 1:1:n
    spec(:, i) = abs(fft(windowing(filtered_Y, shift, width, i), nfft));
end

% variables
fl       = 133.33334;
fh       = 6855.4976;
fft_size = nfft * 2;
fs       = Fs;
L        = width;
fmel     = 1125;

% generate the filterbank
filterbank = mel(fl, fh, fft_size, fs, L, fmel);

% multiply the result with the filterbank
res = filterbank * spec;

% plot the original waveform and the spectogram
x_space = linspace(0, length(Y) - 1, length(Y)) ./ Fs;
figure(1)
subplot(3, 1, 1)
plot(x_space, Y)
xlabel('time (s)')
title('original audiostream')
subplot(3, 1, 2)
imagesc(spec)
title('windowing spectogram')
subplot(3, 1, 3)
imagesc(res)
title('filterbank spectogram');