
fl = 133.33334;
fh = 6855.4976;
fft_size = 1024;
fs = 16000;
L = 24;
fmel = 1125;

% generating the filterbank by calling mel function
filterbank = mel(fl, fh, fft_size, fs, L, fmel);

figure(1)
imagesc(filterbank)
title('Filterbank Spectogram');