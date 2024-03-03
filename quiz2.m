theta = 0.255e-6
B = 19e3
N = 3*theta/2*2*B
S = 299e-3
SNR = S/N

z = sqrt(SNR)
pe = exp(-z^2/2)/(z*sqrt(2*pi))

n = 9;
M = 2^n;
SNRo = M^2/(1+4*(M^2-1)*pe)
SNRodb = 10*log10(SNRo)