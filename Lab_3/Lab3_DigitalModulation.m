%% 
%% 1st section
% Read 

[wav, fs] = audioread("beethoven5_8bits.wav",'native'); %reading audio file

%% 2nd section 
% Run this section when making different levels for QAM.

binary = audioToBinary(wav, 7);  % insert number of bits corresponding to 
                                   % the modulation levels you want to 
                                   % achieve

%% 3rd section
  
% BER = [];        %store your BER values here as a vector
% t = [90.624875, 60.374875,];          %store your t values here as a vector
% BER1 = [out.qam];
% t1 = [out.tout];
% BER2 = [out.qam];
% t2 = [out.tout];

% BER3 = [out.qam];
% t3 = [out.tout];
% BER4 = [out.qam];
% t4 = [out.tout];
% BER5 = [out.qam];
% t5 = [out.tout];
% BER6 = [out.qam];
% t6 = [out.tout];

figure
subplot(2,1,1);
hold on;
plot(BER1); plot(BER2); plot(BER3); plot(BER4);
hold off;