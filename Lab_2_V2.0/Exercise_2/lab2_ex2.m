%% lab 2_ex2
clear;
close all;

load noisySignal.mat;

%Plot the signal before demodulation
%write your code here:


%% Section 2

% Demodulation PAM

n = (1:1:length(signal))./R_s;      % sample vector for the local oscillator
fc = ...;                           % center frequency chosen by you to convert spectrums to baseband
LO = cos(2*pi*n*fc);                % local oscillator

% making a filter for signal 3:

filt_signal = designfilt(     );

s_c = signal.*LO;                % output after local oscillator - converted to baseband
s_f = filter(filt_signal, s_c);  % output after LPF

figure
subplot(3,1,1)
periodogram(signal, [], [], R_s, 'centered');
subplot(3,1,2)
periodogram(s_c, [], [], R_s, 'centered');
subplot(3,1,3)
periodogram(s_f, [], [], R_s, 'centered');
