%% lab 2_ex2_ex3
clear;
close all;

%% Exercise 2:

load noisySignal.mat;

% Demodulating PAM:

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


%% Exercise 3:

load sharedChannel.mat

% Plot the PSD of the signals in the channel

...
    
% Convert to baseband

f_1 = ... ; % choose the appropriate frequencies
f_2 = ... ;
f_3 = ... ;

LO_1 = cos(2*pi*f_1*t_1);
LO_2 = cos(2*pi*f_2*t_2);
LO_3 = cos(2*pi*f_3*t_3);

q_1 = ... ;
q_2 = ... ;
q_3 = ... ;

% Plot the PSDs of the different signals converted to baseband, to see the
% effect of the LOs and what the cut-off frequencies of your filters 
% should be:

...

% making the LPF

LPF = designfilt(   );

r_1 = filter(LPF, q_1) ;
r_2 = filter(LPF, q_2) ;
r_3 = filter(LPF, q_3) ;


% Plot the PSDs of the different signals converted to baseband, to see the
% effect of the LOs and what the cut-off frequencies of your filters 
% should be:

...

%exercise 3.3

message_1 = binaryToChar(r_1*2,   ,   );
message_2 = binaryToChar(r_2*2,   ,   );
message_3 = binaryToChar(r_3*2,   ,   );