%% lab 2 exercise 4
% channel 1 is a high pass filter - manchester?
% channel 2

clear all;
close all;
clc;

binary = randi([0, 1], 200, 1);                 % a random binary vector is created

T_b = 1/(1e6);                                   % Choose bit time. The bit time must be smaller than 
                                                % 1.95 microseconds.
Fc = 2e6;                                       %
                                        
type = 'unipolarNRZ';                           %Choose type of line coding

[encoded, fs] = lineCode(binary, type , T_b); 