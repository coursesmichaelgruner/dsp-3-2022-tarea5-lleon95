#!/usr/bin/env octave-cli
pkg load signal

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

# Plot zoomed spectrum
fig = figure(2)
quantum_start = 50 / quantum
quantum_jump = 1 / quantum
quantum_end = 610 / quantum
zoomm = plot(xticks(quantum_start:quantum_jump:quantum_end), abs(data_fft(:,1)(quantum_start:quantum_jump:quantum_end)));
xlabel ("Frequency [Hz]");
ylabel ("Magnitude");
title ("Spectrum Magnitude (Zoomed)");
hold on;

print("-S1920,1080","-djpg","figure2")

# Plot STFT
win_size = length(data)/4;
maxf = 610
[S, F, T] = specgram(data, win_size, fs);

figure(3)
for n = 1 : 4
  subplot(2,2,n);
  Sx = abs(S(1:win_size * maxf / fs,n));
  samples = length(Sx)
  quantum = maxf / samples;
  xticks = [0:quantum:maxf-quantum];
  plot(xticks, Sx)
  xlabel ("Frequency [Hz]");
  ylabel ("Magnitude");
endfor
hold on;

print("-S1920,1080","-djpg","figure3")

waitfor(s);
waitfor(m);
waitfor(ph);
waitfor(zoomm);
