%% lab 2_ex2
clear;
close all;
load noisySignal.mat;

% Plot the signal before demodulation
figure;
subplot(2,1,1);
plot(signal);
title('Time Domain Signal');
xlabel('Samples');
ylabel('Amplitude');

subplot(2,1,2);
periodogram(signal, [], [], R_s, 'centered');
title('Frequency Domain Signal (Before Demodulation)');

%% Section 2
% Demodulation PAM
% Define Sampling Vector
n = (1:1:length(signal))./R_s; % Sample vector for the local oscillator

% Define Center Frequency
fc = 500;

% Create Local Oscillator
LO = cos(2*pi*n*fc); % Local oscillator for mixing

% Design a Lowpass Filter
% CORRECTED: Passband frequency must be less than stopband frequency
filt_signal = designfilt('lowpassfir', ...
    'PassbandFrequency', 0.25e3, ...    % Changed from 0.5e3
    'StopbandFrequency', 0.5e3, ...     % Changed from 0.25e3
    'PassbandRipple', 2, ...
    'StopbandAttenuation', 60, ...
    'SampleRate', 10e3, ...
    'DesignMethod', 'kaiserwin');

% Demodulate: Mix with Local Oscillator and Filter
s_c = signal.*LO; % Output after local oscillator - converted to baseband
s_f = filter(filt_signal, s_c); % Output after LPF

% Plot PSDs
figure;
subplot(3,1,1);
periodogram(signal, [], [], R_s, 'centered');
title('Original Signal Spectrum');

subplot(3,1,2);
periodogram(s_c, [], [], R_s, 'centered');
title('Signal After Mixing with LO');

subplot(3,1,3);
periodogram(s_f, [], [], R_s, 'centered');
title('Signal After Lowpass Filtering');