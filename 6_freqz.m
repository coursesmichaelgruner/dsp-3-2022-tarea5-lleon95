#!/usr/bin/env octave-cli
pkg load signal

b = zeros(1, 800);
b(1) = 1; 
b(800) = -1;
a = [1 -1];

fs = 48000;
ff = fs / 2;

[H, w] =  freqz(b, a, ff);
f = ff * w / pi;

m = plot(f(1:1200), abs(H)(1:1200));
xlabel ("Frequency [Hz]");
ylabel ("Magnitude");
title ("Frequency response");
hold on;
waitfor(m);
