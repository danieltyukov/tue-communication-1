
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

f_1 = ... ; % choose the appropriate frequencies
f_2 = ... ;
f_3 = ... ;

LO_1 = cos(2*pi*f_1*t_1);
LO_2 = cos(2*pi*f_2*t_1);
LO_3 = cos(2*pi*f_3*t_1);

q_1 = ... ;
q_2 = ... ;
q_3 = ... ;

% Plot the PSDs of the different signals converted to baseband, to see the
% effect of the LOs and what the cut-off frequencies of your filters 
% should be:

...

% define the LPF filter by replacing defining the bandwidth for each signal
% this should result 


B1=...;
B2=...;
B3=...;

LPF1 = designfilt('lowpassfir','PassbandFrequency', B1 ,'StopbandFrequency',3*B1 ,'PassbandRipple',4,'StopbandAttenuation',60,'SampleRate',R_s,'DesignMethod','kaiserwin');
LPF2 = designfilt('lowpassfir','PassbandFrequency', B2 ,'StopbandFrequency', 3*B2 ,'PassbandRipple',4,'StopbandAttenuation',30,'SampleRate',R_s,'DesignMethod','kaiserwin');
LPF3 = designfilt('lowpassfir','PassbandFrequency', B3 ,'StopbandFrequency', 3*B3 ,'PassbandRipple',4,'StopbandAttenuation',60,'SampleRate',R_s,'DesignMethod','kaiserwin');


r_1 = filter(LPF1, q_1) ;
r_2 = filter(LPF2, q_2) ;
r_3 = filter(LPF3, q_3) ;


% Plot the PSDs of the different signals converted to baseband, to see the
% effect of the LOs and what the cut-off frequencies of your filters 
% should be:

....

%% 

%exercise 3.3: file in the linecodes that you found

message_1 = DecodeMessage(r_1, t_1, 1, "");
message_2 = DecodeMessage(r_2, t_1, 2, "");
message_3 = DecodeMessage(r_3, t_1, 3, "");