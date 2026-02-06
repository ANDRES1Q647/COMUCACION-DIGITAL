clear; clc; close all;

% Parámetros
Fs = 100000;          % Frecuencia de muestreo (Hz)
f0 = 1400;           % Frecuencia del seno (Hz)

L = 1000;            % Número de muestras
t = 0:1/Fs:1;
x = sin(2*pi*f0*t);  % Señal seno

% FFT
NFFT = 1024;
Y = fft(x, NFFT);
P2 = abs(Y)/L;
P1 = P2(1:NFFT/2+1);
P1(2:end-1) = 2*P1(2:end-1);

f = Fs*(0:(NFFT/2))/NFFT;

% -------- Gráficas --------
figure;

% Dominio del tiempo (zoom)
plot(t, x, 'LineWidth', 1.5)
xlim([0 0.005])            % Zoom para ver bien la seno
ylim([-1.2 1.2])
xlabel('Tiempo (s)')
ylabel('Amplitud')
title('Señal seno de 1400 Hz en el tiempo')
grid on

figure;
plot(f, P1, 'LineWidth', 1.5)
xlim([0 3000])
xlabel('Frecuencia (Hz)')
ylabel('|X(f)|')
title('FFT de una señal seno de 1400 Hz')
grid on
