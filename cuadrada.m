% -------- Parámetros --------
Fs = 100000;          % Frecuencia de muestreo (Hz)
f0 = 1400;            % Frecuencia de la señal cuadrada (Hz)

L = 1000;             % Número de muestras
T = 1/f0;
t = (0:L-1)/Fs;       % Vector de tiempo
x = square(2*pi*f0*t); % Señal cuadrada

% -------- FFT --------
NFFT = 1024;
Y = fft(x, NFFT);

P2 = abs(Y)/L;
P1 = P2(1:NFFT/2+1);
P1(2:end-1) = 2*P1(2:end-1);

f = Fs*(0:(NFFT/2))/NFFT;

% -------- Gráficas --------
% Dominio del tiempo
figure;
plot(t, x, 'LineWidth', 1.5)
xlim([0 0.005])
ylim([-1.2 1.2])
xlabel('Tiempo (s)')
ylabel('Amplitud')
title('Señal cuadrada de 1400 Hz en el dominio del tiempo')
grid on
line([0 T], [0 0], 'Color', 'r', 'LineWidth', 2)
text(T/2, 0.1, 'T = periodo de la señal', 'Color', 'r', 'FontSize', 12, 'HorizontalAlignment', 'center')

% Dominio de la frecuencia
figure;
plot(f, P1, 'LineWidth', 1.5)
xlim([0 3000])
xlabel('Frecuencia (Hz)')
ylabel('|X(f)|')
title('FFT de la señal cuadrada de 1400 Hz')
grid on
