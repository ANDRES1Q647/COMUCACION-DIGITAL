% -----------------------------
% Parámetros
% -----------------------------
fs = 14000;                % Frecuencia de muestreo (14 kHz)
f_pulse = 1400;            % Frecuencia equivalente del pulso (1/f)
T = 1 / f_pulse;           % Ancho del pulso (1 ms en este caso)

% -----------------------------
% Vector de tiempo
% -----------------------------
t = -0.05 : 1/fs : 0.05;   % Tiempo centrado en cero

% -----------------------------
% Pulso rectangular (centro en 0)
% -----------------------------
x = rectpuls(t, T);

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
title(['Pulso Rectangular']);
xlabel('Tiempo (ms)');
ylabel('Amplitud');
axis([-10 10 -0.2 1.2]);
grid on;

subplot(2,1,2);
plot(f_axis, X_mag, 'g', 'LineWidth', 1.5);
title('Espectro de Magnitud (Función Sinc)');
xlabel('Frecuencia (Hz)');
ylabel('Magnitud');
xlim([-5000 5000]);
grid on;
