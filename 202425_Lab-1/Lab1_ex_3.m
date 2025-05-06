%% Exercise 3.2
clear all;
close all;
clc; 

load 'FUNC.mat';
FUNC = FUNC(1:600);

%Do not change any of the values below!
%pulsetrain parameters
n = 10^(-6);                                                       
T_s = 50*n;
tau_1 = (1/4)*T_s;                 
delay1 = (0:50:600)*n;
t_1 = (0:1:600-1)*n;

train1 = pulstran(t_1, delay1, 'rectpuls', tau_1); %the pulsetrain to get WAVE_SAMP
WAVE_SAMP = FUNC.*train1;

% %space for you to create its spectral plot

%% Exercise 3.3
clear all;
close all;
clc; 

load 'FUNC.mat';
FUNC = FUNC(1:600);
%Do not change any of the values below!
%pulsetrain TAU_NEW parameters
n = 10^(-6);
T_s2 = 50*n;
tau_2 = (1/2)*T_s2;
delay2 = (0:50:600)*n;
t_2 = (0:1:600-1)*n;

train2 = pulstran(t_2, delay2, 'rectpuls', tau_2);

%pulsetrain TS_NEW parameters
n = 10^(-6);
T_s3 = 10*n;
tau_3 = (1/8)*T_s3;
delay3 = (0:10:600)*n;
t_3 = (0:1:600-1)*n;

train3 = pulstran(t_3, delay3, 'rectpuls', tau_3);

t_1 = (0:1:600-1)*n;


%space for you to multiply FUNC with the correct pulsetrain and plot
%its time and frequency domain plots
