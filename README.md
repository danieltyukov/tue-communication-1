# Communication 1 (5ETC0), TU/e

MATLAB work for the Communication 1 course (course code 5ETC0) in the Electrical
Engineering programme at Eindhoven University of Technology (TU/e). The repository holds
the three lab assignments plus a set of short quiz scripts. The labs move from analog
signal sampling and spectral analysis, through analog demodulation and multiplexing, to
digital modulation with QAM.

## What the work covers

The exercises build up a working communication chain in MATLAB and Simulink:

- Sampling a continuous waveform with a rectangular pulse train and inspecting the effect
  in the frequency domain, then varying the sample period and duty cycle to see aliasing
  and spectral replication.
- Computing single-sided amplitude and dB spectra directly from the FFT, using helper
  functions written for the course.
- Demodulating an amplitude-modulated signal by mixing with a local oscillator and
  filtering the result with a designed FIR lowpass, recovering the baseband message.
- Separating several messages that share one channel by frequency-division multiplexing,
  choosing per-channel oscillator frequencies and filter bandwidths, then decoding each
  stream from its line code.
- Encoding random bit streams with unipolar and bipolar RZ and NRZ line codes and looking
  at their spectra.
- Mapping 8-bit audio samples onto square QAM constellations, sweeping the number of bits
  per symbol, and measuring bit error rate against timing offset.

Alongside the labs, the quiz scripts work through analytical problems: Fourier series
coefficients by numerical integration, PCM signal-to-noise ratio with quantization and
threshold noise, and the mode condition for light propagating in a step-index optical
fiber.

## Contents

| Path | Topic |
| --- | --- |
| `Lab 1`, `202425_Lab-1` | Sampling with pulse trains, FFT spectra, quantizing noise |
| `calculateSpectrum.m`, `calculateSpectrumdB.m` | FFT-based amplitude and dB spectrum helpers |
| `Lab 2`, `Lab_2_V2.0` | AM demodulation, frequency-division multiplexing, line coding |
| `Lab_2_V2.0/Exercise_4/Lab2_LineCoding.slx` | Simulink model for line coding |
| `Lab_3`, `Lab_3 (2)` | QAM digital modulation, audio-to-symbol mapping, BER analysis |
| `Lab_3 (2)/generateQAMConstellation.m` | Square QAM constellation generator |
| `Lab_3 (2)/audioToBinary.m`, `binaryToAudio.m` | Convert 8-bit audio to and from symbol indices |
| `quiz1.m` | Fourier series coefficients by numerical integration |
| `quiz2.m`, `week3_1.m` | PCM signal-to-noise ratio with quantization and threshold noise |
| `quiz4.m` | Step-index fiber mode condition and propagation angles |

## Topics

- Sampling, the sampling theorem, and aliasing
- Fourier series and the discrete Fourier transform
- Power spectral density and periodogram estimation
- Amplitude modulation and coherent demodulation
- FIR lowpass filter design (Kaiser window)
- Frequency-division multiplexing
- Line coding: unipolar and bipolar, RZ and NRZ
- Quadrature amplitude modulation and constellation design
- Bit error rate versus sampling instant
- Pulse-code modulation and quantization noise
- Step-index optical fiber propagation

## Running

Open the scripts in MATLAB (developed against R2019b through R2023a). Each lab folder is
self-contained. Run the top-level script in a folder; the Lab 2 and Lab 3 line coding and
modulation exercises also depend on the provided Simulink models (`.slx`) and the packaged
functions in the same folder. Data files (`.mat`, `.wav`) needed by a script sit next to it.

## Technologies

MATLAB, Simulink, Signal Processing Toolbox.
