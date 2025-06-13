function constellationPoints = generateQAMConstellation(bits)
    M = 2^bits;
    x = (0:M-1)';
    Y = qammod(x,M);
    constellationPoints = (Y/mean(abs(Y)))*0.9343;
end