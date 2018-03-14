%Rut= 18509828-1
A=1;B=8;C=5;D=0;E=9;F=8;G=2;H=8;I=1;
t=0:  0.3 :30; v=exp(-((B+A)/(2*C*(D+E)))*t).*sin(t);
subplot 121; plot (t,v);title('PLOT');
xlabel('Tiempo(seg)'); ylabel('Volts'); grid;
subplot 122; stem(t,v);title('STEM');
xlabel('Tiempo(seg)'); ylabel('Volts'); grid;
