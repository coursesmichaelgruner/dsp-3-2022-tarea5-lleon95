#!/usr/bin/env octave-cli

[data, fs] = audioread('la_muerte_del_angel_power_noise.wav');

# Plot signal
fig = figure(1)
subplot(2,2,1:2);
s = plot(data);
xlabel ("Sample");
ylabel ("Amplitude");
title ("Signal sample in time");
hold on;

# Plot signal spectrum
data_fft = fft(data);
samples = length(data_fft(:,1));
quantum = 48000/samples;
xticks = [0:quantum:48000-quantum];

subplot(2,2,3);
m = plot(xticks, abs(data_fft(:,1)));
xlabel ("Frequency [Hz]");
ylabel ("Magnitude");
title ("Spectrum Magnitude");
hold on;
subplot(2,2,4);
ph = plot(xticks, angle(data_fft(:,1)));
xlabel ("Frequency [Hz]");
ylabel ("Phase");
title ("Spectrum Phase");
hold on;

print("-S1920,1080","-djpg","figure1")
waitfor(s);
waitfor(m);
waitfor(ph);
