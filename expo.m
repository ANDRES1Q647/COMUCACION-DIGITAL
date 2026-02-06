% -----------------------------
% Parámetros
% -----------------------------
fs = 14000;                % Frecuencia de muestreo (Hz)
t = -0.01 : 1/fs : 0.01;   % Vector de tiempo centrado en cero

% Parámetros de la exponencial
A = 1;                     % Amplitud
alpha = 800;               % Constante de decaimiento

% -----------------------------
% Señal exponencial de decaimiento (causal)
% -----------------------------
u = double(t >= 0);        % Escalón unitario
x = A * exp(-alpha*t) .* u;

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
title('Señal Exponencial de Decaimiento');
xlabel('Tiempo (ms)');
ylabel('Amplitud');
grid on;

subplot(2,1,2);
plot(f_axis, X_mag, 'r', 'LineWidth', 1.5);
title('Espectro de Magnitud de la Señal Exponencial');
xlabel('Frecuencia (Hz)');
ylabel('Magnitud');
xlim([-5000 5000]);
grid on;
