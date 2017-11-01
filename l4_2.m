clc;
%=== Завдання #2.1 ===
% Моделювання досліджуваного сигналу

 fs =  200; N =  4000; 
 t = (0:(N-1))/fs ;		% вектор часу
 v =  2*randn(size(t));  
 s =sin(2*pi*10*t);
 x =  s+v;

%=== Завдання #2.3 ===
% Синтезу адаптивного фільтру. Фільтрація змодельваного сигналу.
L = 128 ; mu = 0.0001 ;
[y,e,w] = lms(x,s,mu,L);
% Графіки результату фільтрації
figure(1)
subplot(311), plot(t,y), xlim([0,2]), title ('Відфільтрований сигнал'), xlabel('t'), ylabel('y'); 
subplot(312), plot(t,x), xlim([0,2]), title ('Початковий сигнал з шумом'), xlabel('t'), ylabel('x'); 
subplot(313), plot(t,s), xlim([0,2]), title ('Початковий сигнал без шуму'), xlabel('t'), ylabel('s'); 

% ----- АЧХ адаптивного фільтру
n =  512;  % кількість точок, що розраховуються
figure(2)
a =  1;
b=w;
[h,w]=freqz(b,a,n);
 mag = abs(h);
 plot(w/(2*pi)*fs,mag),title ('АЧХ'),grid on

 
 %=== Завдання #2.4 ===
% Дослідження залежності часу адаптації від коефіцієнта адаптації
 mu = 0.000001 ;
[y,e,w] = lms(x,s,mu,L);
% Графіки результату фільтрації
figure(3)
mu = 0.000001 ;
subplot(511), plot(t,y), xlim([0,4]), title ('Відфільтрований сигнал, mu = 0.000001'), xlabel('t'), ylabel('y'); 
mu = 0.00001 ;
[y,e,w] = lms(x,s,mu,L);
subplot(512), plot(t,y), xlim([0,4]), title ('Відфільтрований сигнал, mu = 0.00001'), xlabel('t'), ylabel('x'); 
mu = 0.0001 ;
[y,e,w] = lms(x,s,mu,L);
subplot(513), plot(t,y), xlim([0,4]), title ('Відфільтрований сигнал, mu = 0.0001 ;'), xlabel('t'), ylabel('s'); 
mu = 0.001 ;
[y,e,w] = lms(x,s,mu,L);
subplot(514), plot(t,y), xlim([0,4]), title ('Відфільтрований сигнал, mu = 0.001 ;'), xlabel('t'), ylabel('s'); 
mu = 0.01 ;
[y,e,w] = lms(x,s,mu,L);
subplot(515), plot(t,y), xlim([0,6]), title ('Відфільтрований сигналу, mu = 0.01 ;'), xlabel('t'), ylabel('s'); 


%=== Завдання #2.5 ===
% Дослідження процедури адаптивної фільтрації при різній довжині фільтру

L = 256 ; mu = 0.0001 ;
[y,e,w] = lms(x,s,mu,L);
% Графіки результату фільтрації
figure(4)
subplot(311), plot(t,y), xlim([0,4]), title ('Відфільтрований сигнал,L = 256'), xlabel('t'), ylabel('y'); 
subplot(312), plot(t,x), xlim([0,2]), title ('Початковий сигнал з шумом'), xlabel('t'), ylabel('x'); 
subplot(313), plot(t,s), xlim([0,2]), title ('Початковий сигнал без шуму'), xlabel('t'), ylabel('s'); 



L = 512 ; mu = 0.0001 ;
[y,e,w] = lms(x,s,mu,L);
% Графіки результату фільтрації
figure(5)
subplot(311), plot(t,y), xlim([0,3]), title ('Відфільтрований сигнал,L = 512'), xlabel('t'), ylabel('y'); 
subplot(312), plot(t,x), xlim([0,2]), title ('Початковий сигнал з шумом'), xlabel('t'), ylabel('x'); 
subplot(313), plot(t,s), xlim([0,2]), title ('Початковий сигнал без шуму'), xlabel('t'), ylabel('s'); 

L = 1024 ; mu = 0.0001 ;
[y,e,w] = lms(x,s,mu,L);
% Графіки результату фільтрації
figure(6)
subplot(311), plot(t,y), xlim([0,6]), title ('Відфільтрований сигнал,L = 1024'), xlabel('t'), ylabel('y'); 
subplot(312), plot(t,x), xlim([0,2]), title ('Початковий сигнал з шумом'), xlabel('t'), ylabel('x'); 
subplot(313), plot(t,s), xlim([0,2]), title ('Початковий сигнал без шуму'), xlabel('t'), ylabel('s'); 

