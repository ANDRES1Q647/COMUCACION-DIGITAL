clear; clc; close all;

% -----------------------------
% Parámetros
% -----------------------------
Fs = 100000;          % Frecuencia de muestreo (Hz)
F0 = 1400;            % Frecuencia de la señal (Hz)

L = 1000;             
t = (0:L-1)/Fs;       % Vector de tiempo

% -----------------------------
% Señal diente de sierra
% -----------------------------
x = sawtooth(2*pi*F0*t);

% -----------------------------
% FFT
% -----------------------------
NFFT = 1024;
X = fft(x, NFFT);

P2 = abs(X)/L;
P1 = P2(1:NFFT/2+1);
P1(2:end-1) = 2*P1(2:end-1);

f = Fs*(0:(NFFT/2))/NFFT;

% -----------------------------
% Gráficas
% -----------------------------
% Dominio del tiempo
figure;
plot(t, x, 'LineWidth', 1.5)
xlim([0 0.005])
ylim([-1.2 1.2])
xlabel('Tiempo (s)')
ylabel('Amplitud')
title('Señal diente de sierra de 1400 Hz en el dominio del tiempo')
grid on

% Dominio de la frecuencia
figure;
plot(f, P1, 'LineWidth', 1.5)
xlim([0 5000])
xlabel('Frecuencia (Hz)')
ylabel('|X(f)|')
title('FFT de la señal diente de sierra')
grid on
