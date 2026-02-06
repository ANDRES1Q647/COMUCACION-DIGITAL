% -----------------------------
% Parámetros
% -----------------------------
fs = 14000;                % Frecuencia de muestreo (Hz)
t = -0.01 : 1/fs : 0.01;   % Vector de tiempo centrado en cero

% Parámetros del pulso gaussiano
sigma = 0.0005;            % Desviación estándar (ancho del pulso)
A = 1;                     % Amplitud

% -----------------------------
% Pulso Gaussiano
% -----------------------------
x = A * exp(-t.^2 / (2*sigma^2));

% -----------------------------
% FFT con zero padding
% -----------------------------
N = 2^12;
X = fft(x, N);
X_mag = abs(fftshift(X)) / N;
f_axis = linspace(-fs/2, fs/2, N);

% -----------------------------
% Graficar
% -----------------------------
figure;

subplot(2,1,1);
plot(t*1000, x, 'LineWidth', 2);
title('Pulso Gaussiano');
xlabel('Tiempo (ms)');
ylabel('Amplitud');
grid on;

subplot(2,1,2);
plot(f_axis, X_mag, 'r', 'LineWidth', 1.5);
title('Espectro de Magnitud del Pulso Gaussiano');
xlabel('Frecuencia (Hz)');
ylabel('Magnitud');
xlim([-5000 5000]);
grid on;
