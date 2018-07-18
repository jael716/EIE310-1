b = [0.05    0.45    0.56   0.44    0.05]; % definición de h1(n)
b = b / (sum(b)); % para que H(0) sea = 1
[H, w] = freqz(b, 1);
n = [0 : 0.1 : 3.9] * pi; x = square(n); % genera onda cuadrada
y = conv(x, b); % filtra la onda cuadrada
subplot 221; stem(x); title('x (entrada h1)');
axis([0 45 -1.5 1.5]); xlabel('n'); grid
subplot 223; stem(y); title('y (salida h1)');
axis([0 45 -1.5 1.5]); xlabel('n'); grid



r =[3.2    0.25    0.4   0.6    0.25]; % definición de h2(n)
r = r/ (sum(r)); % para que H(0) sea = 1
[F, w] = freqz(r, 1);
l = [0 : 0.1 : 3.9] * pi; s = square(l); % genera onda cuadrada
p = conv(s, r); % filtra la onda cuadrada
subplot 222; stem(s); title('x (entrada h2)');
axis([0 45 -1.5 1.5]); xlabel('n'); grid
subplot 224; stem(p); title('y (salida h2)');
axis([0 45 -1.5 1.5]); xlabel('n'); grid