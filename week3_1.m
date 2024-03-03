for n=5:10
    n
    SNRa=7.94e-3/(2e-11*n*2e6)
    Z=(SNRa)^0.5
    Pe=exp(-SNRa/2)/(Z*(2*pi)^0.5)
    SNRout=2^(2*n)/(1+4*Pe*(2^(2*n)-1))
    SNRoutdB=10*log10(SNRout)
end