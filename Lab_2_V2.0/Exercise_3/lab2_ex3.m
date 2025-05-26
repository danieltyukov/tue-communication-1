
%% Exercise 3:
clear;
close all;

load sharedChannel.mat
R_s = 6*1e+6/2;
Bitrate = 15*1e+3;
% Plot the PSD of the signals in the channel
% write your code here

%% 
% Convert to baseband

% figure
% periodogram(sharedChannel,[],[],R_s,'centered')

f_1 = 175e3;     % 0.175 MHz  – smallest-frequency pair
f_2 = 250e3;     % 0.250 MHz
f_3 = 550e3;     % 0.550 MHz  – largest-frequency pair

LO_1 = cos(2*pi*f_1*t_1);
LO_2 = cos(2*pi*f_2*t_1);
LO_3 = cos(2*pi*f_3*t_1);

q_1 = sharedChannel .* LO_1;
q_2 = sharedChannel .* LO_2;
q_3 = sharedChannel .* LO_3;

% Plot the PSDs of the different signals converted to baseband, to see the
% effect of the LOs and what the cut-off frequencies of your filters 
% should be:

LPF = designfilt('lowpassfir', 'StopbandFrequency', 0.5e3, ...
    'PassbandFrequency' , 0.1e3, 'PassbandRipple', 2, ...
    'StopbandAttenuation', 60, 'SampleRate', 10e3, ...
    'DesignMethod', 'kaiserwin');

% define the LPF filter by replacing defining the bandwidth for each signal
% this should result 


B1 = 87.5e3;   % 15 kHz
B2 = 125e3;   % 30 kHz
B3 = 275e3;   % 15 kHz

LPF1 = designfilt('lowpassfir','PassbandFrequency', B1 ,'StopbandFrequency',3*B1 ,'PassbandRipple',4,'StopbandAttenuation',60,'SampleRate',R_s,'DesignMethod','kaiserwin');
LPF2 = designfilt('lowpassfir','PassbandFrequency', B2 ,'StopbandFrequency', 3*B2 ,'PassbandRipple',4,'StopbandAttenuation',30,'SampleRate',R_s,'DesignMethod','kaiserwin');
LPF3 = designfilt('lowpassfir','PassbandFrequency', B3 ,'StopbandFrequency', 3*B3 ,'PassbandRipple',4,'StopbandAttenuation',60,'SampleRate',R_s,'DesignMethod','kaiserwin');


r_1 = filter(LPF1, q_1) ;
r_2 = filter(LPF2, q_2) ;
r_3 = filter(LPF3, q_3) ;


% Plot the PSDs of the different signals converted to baseband, to see the
% effect of the LOs and what the cut-off frequencies of your filters 
% should be:

figure;
subplot(3,1,1);
periodogram(r_1,[],[],R_s,'centered');
title('PSD of r\_1 (filtered message 1)');
xlabel('Frequency (Hz)'); ylabel('Power/Frequency (dB/Hz)');

subplot(3,1,2);
periodogram(r_2,[],[],R_s,'centered');
title('PSD of r\_2 (filtered message 2)');
xlabel('Frequency (Hz)'); ylabel('Power/Frequency (dB/Hz)');

subplot(3,1,3);
periodogram(r_3,[],[],R_s,'centered');
title('PSD of r\_3 (filtered message 3)');
xlabel('Frequency (Hz)'); ylabel('Power/Frequency (dB/Hz)');

%% 

%exercise 3.3: file in the linecodes that you found

message_1 = DecodeMessage(r_1, t_1, 1, "unipolarRZ");
message_2 = DecodeMessage(r_2, t_1, 2, "unipolarNRZ");
message_3 = DecodeMessage(r_3, t_1, 3, "bipolarRZ");

fprintf('Message 1: %s\n', message_1);
fprintf('Message 2: %s\n', message_2);
fprintf('Message 3: %s\n\n', message_3);