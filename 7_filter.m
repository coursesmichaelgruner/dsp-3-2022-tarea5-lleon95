#!/usr/bin/env octave-cli
pkg load signal

[data, fs] = audioread('la_muerte_del_angel_power_noise.wav');

b = zeros(1, 800);
b(1) = 1; 
b(800) = -1;
a = [1 -1];

filter_data = filter (b, a, data);
audiowrite('la_muerte_del_angel_filter.wav', filter_data, fs);

# Plot signal
fig = figure(7)
subplot(4,1,1);
s = plot(data);
xlabel ("Sample");
ylabel ("Amplitude");
title ("Contaminated signal sample in time");
hold on;
subplot(4,1,2);
s = plot(filter_data);
xlabel ("Sample");
ylabel ("Amplitude");
title ("Filtered signal sample in time");
hold on;

# Plot signal spectrum
data_fft = fft(filter_data);
samples = length(data_fft(:,1));
quantum = fs/samples;
xticks = [0:quantum:fs-quantum];

subplot(4,1,3);
quantum_start = 50 / quantum
quantum_jump = 1 / quantum
quantum_end = 610 / quantum
zoomm = plot(xticks(quantum_start:quantum_jump:quantum_end), abs(data_fft(:,1)(quantum_start:quantum_jump:quantum_end)));
xlabel ("Frequency [Hz]");
ylabel ("Magnitude");
title ("Filtered Magnitude (Zoomed)");
hold on;

# Plot signal spectrum
data_fft = fft(data);
samples = length(data_fft(:,1));
quantum = fs/samples;
xticks = [0:quantum:fs-quantum];

subplot(4,1,4);
quantum_start = 50 / quantum
quantum_jump = 1 / quantum
quantum_end = 610 / quantum
zoomm = plot(xticks(quantum_start:quantum_jump:quantum_end), abs(data_fft(:,1)(quantum_start:quantum_jump:quantum_end)));
xlabel ("Frequency [Hz]");
ylabel ("Magnitude");
title ("Noisy Magnitude (Zoomed)");
hold on;

print("-S1920,1080","-djpg","figure7");

waitfor(zoomm);
