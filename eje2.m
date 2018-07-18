% Datos
fc = 200; % frecuencia de corte en [Hz]
FC = 250;
Fs = 1000; % frec. de muestreo en [Hz]
N = 1001; % longitud de la respuesta impulso
f1 = 0; % frec. mínima para el cálculo de la respuesta de frec.
f2 = 500; % frec. máxima para el cálculo de la respuesta de frec.
m1 = 1e-6; % límite inferior del gráfico de magnitud
% Diseña el filtro
wn = [2 * fc / Fs, 2 * FC / Fs ];
b = fir1(N-1, wn, hanning(N));
t = fir1(N-1, wn,hamming(N));
k = fir1(N-1, wn,kaiser(N,10));
% Graba h(n)
h = b'; save 'h.txt' h -ascii
j = t'; save 't.txt' j -ascii
v = k'; save 'k.txt' v -ascii
% Calcula la respuesta de frecuencia obtenida
f = [f1 : (f2-f1)/1023 : f2];
H = freqz(b, 1, f, Fs);
J = freqz(t, 1, f, Fs);
V = freqz(k, 1, f, Fs);
% Grafica h(n)
n = [1 : N]; subplot 411; stem(n, b); grid; xlabel('n'); title('h(n)')

% Grafica Mag[H(f)]
subplot 412; semilogy(f, abs(H)); grid
axis([f1 f2 m1 1.1]); xlabel('f[Hz]'); title('Mag hamming')

subplot 413; semilogy(f, abs(J)); grid
axis([f1 f2 m1 1.1]); xlabel('f[Hz]'); title('Mag hanning')

subplot 414; semilogy(f, abs(V)); grid
axis([f1 f2 m1 1.1]); xlabel('f[Hz]'); title('Mag kaiser')