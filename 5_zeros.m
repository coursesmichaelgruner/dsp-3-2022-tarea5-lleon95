#!/usr/bin/env octave-cli
pkg load signal

b = zeros(1, 800);
b(1) = 1; 
b(800) = -1;
a = [1 -1];

m = zplane (b, a);
