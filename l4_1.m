clc;
%=== Завдання #1.1 ===
% Моделювання досліджуваного сигналу
 fs =  200; N =  400; 
 t = (0:(N-1))/fs ;		% вектор часу
 v =  2*randn(size(t));  
 s =sin(2*pi*10*t)+sin(2*pi*20*t);
 x =  s+v;


%=== Завдання #1.2 ===
 %Синтезування оптимального фільтру Вінера довжиною L=32
 L =  32; 			       % порядок фільтра
 b = wiener_hopf(x,s,L);	   % обчислення коефіцієнтів

%=== Завдання #1.3 ===
 %Фільтрація досліджуваного сигналу 
 a = 1;
 y = filter(b,a,x);
figure(1)
subplot(311), plot(t,y), xlim([0,2]), title ('Відфільтрований сигнал'), xlabel('t'), ylabel('y'); 
subplot(312), plot(t,x), xlim([0,2]), title ('Початковий сигнал з шумом'), xlabel('t'), ylabel('x'); 
subplot(313), plot(t,s), xlim([0,2]), title ('Початковий сигнал без шуму'), xlabel('t'), ylabel('s'); 

... 
% ------ АЧХ фільтру Вінера
 n = 512;  % кількість точок, що розраховуються
 figure(2)
 [h,w]=freqz(b,a,n);
 mag = abs(h);
 plot(w/(2*pi)*fs,mag),title ('АЧХ'),grid on
 dispersia_32=var(y)
 
  % L = 128
 L = 128; 			       % порядок фільтра
 b = wiener_hopf(x,s,L);	   % обчислення коефіцієнтів
 y = filter(b,a,x);
figure(3)
subplot(311), plot(t,y), xlim([0,2]), title ('Відфільтрований сигнал, L = 128'), xlabel('t'), ylabel('y'); 
subplot(312), plot(t,x), xlim([0,2]), title ('Початковий сигнал з шумом, L = 128'), xlabel('t'), ylabel('x'); 
subplot(313), plot(t,s), xlim([0,2]), title ('Початковий сигнал без шуму, L = 128'), xlabel('t'), ylabel('s'); 

% ------ АЧХ фільтру Вінера
 n = 512;  % кількість точок, що розраховуються
 figure(4)
 [h,w]=freqz(b,a,n);
 mag = abs(h);
 plot(w/(2*pi)*fs,mag),title ('АЧХ, L = 128'),grid on
 dispersia_128=var(y)
 
 
 % L = 256
 L = 256; 			       % порядок фільтра
  b = wiener_hopf(x,s,L);	   % обчислення коефіцієнтів
 y = filter(b,a,x);
figure(5)
subplot(311), plot(t,y), xlim([0,2]), title ('Відфільтрований сигнал, L = 256'), xlabel('t'), ylabel('y'); 
subplot(312), plot(t,x), xlim([0,2]), title ('Початковий сигнал з шумом, L = 256'), xlabel('t'), ylabel('x'); 
subplot(313), plot(t,s), xlim([0,2]), title ('Початковий сигнал без шуму, L = 256'), xlabel('t'), ylabel('s'); 

... 
% ------ АЧХ фільтру Вінера
 n = 512;  % кількість точок, що розраховуються
 figure(6)
 [h,w]=freqz(b,a,n);
 mag = abs(h);
 plot(w/(2*pi)*fs,mag),title ('АЧХ, L = 256'),grid on
 dispersia_256=var(y)
 
 
 
 % L = 64
 L = 64; 			       % порядок фільтра
 b = wiener_hopf(x,s,L);	   % обчислення коефіцієнтів
 y = filter(b,a,x);
figure(7)
subplot(311), plot(t,y), xlim([0,2]), title ('Відфільтрований сигнал, L = 64'), xlabel('t'), ylabel('y'); 
subplot(312), plot(t,x), xlim([0,2]), title ('Початковий сигнал з шумом, L = 64'), xlabel('t'), ylabel('x'); 
subplot(313), plot(t,s), xlim([0,2]), title ('Початковий сигнал без шуму, L = 64'), xlabel('t'), ylabel('s'); 

... 
% ------ АЧХ фільтру Вінера
 n = 512;  % кількість точок, що розраховуються
 figure(8)
 [h,w]=freqz(b,a,n);
 mag = abs(h);
 plot(w/(2*pi)*fs,mag),title ('АЧХ, L = 64'),grid on
 dispersia_64=var(y)