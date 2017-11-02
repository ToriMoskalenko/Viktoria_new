clc
clear
close all
%=== Завдання #3.1 ===
% Моделювання досліджуваного сигналу
fs =  200; N =  400;
t = (0:(N-1))/fs ;	
s1=sin(2*pi*10*t);
s2=sin(2*pi*20*t);
s=[s1 s2];
t=(0:length(s)-1)/fs;
v=2*randn(size(t));
x=s+v;
 %Фільтрація досліджуваного сигналу 
L = 128 ; mu = 0.0001 ;
[y,e,w] = lms(x,s,mu,L);
% Графіки результату фільтрації
figure(1)
subplot(311), plot(t,y), xlim([0,4]), title ('Відфільтрований сигнал'), xlabel('t'), ylabel('y'); 
subplot(312), plot(t,x), xlim([0,4]), title ('Початковий сигнал з шумом'), xlabel('t'), ylabel('x'); 
subplot(313), plot(t,s), xlim([0,4]), title ('Початковий сигнал без шуму'), xlabel('t'), ylabel('s'); 

% ----- АЧХ адаптивного фільтру
n =  512;  % кількість точок, що розраховуються
figure(2)
a =  1;
b=w;
[h,w]=freqz(b,a,n);
 mag = abs(h);
 plot(w/(2*pi)*fs,mag),title ('АЧХ'),grid on

 
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
subplot(515), plot(t,y), xlim([0,4]), title ('Відфільтрований сигналу, mu = 0.01 ;'), xlabel('t'), ylabel('s'); 

