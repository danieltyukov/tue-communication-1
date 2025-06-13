%% 
%% 1st section
% Read 

[wav, fs] = audioread("beethoven5_8bits.wav",'native'); %reading audio file

%% 2nd section 
% Run this section when making different levels for QAM.

bits_per_symbol =  audioToBinary(wav, 8); %insert number of bits corresponding to 
                                   % the modulation levels you want to 
                                   % achieve

                                  
constellationPoints = generateQAMConstellation(bits_per_symbol); %Create the constellation points that match to this QAM level.

%% 3rd section
  
% BER = [ ];        %store your BER values here as a vector
% t = [ ];          %store your t values here as a vector

% figure
% subplot(2,1,1);
% plot(BER);
% ylabel('BER');
% subplot(2,1,2);
% plot(t);
% ylabel('t [s]');

figure
subplot(2,1,1);
hold on;
plot(BER1); plot(BER2); plot(BER3); plot(BER4);
hold off;