clc
clear
close all
%=== Завдання #4.1 ===
% Завантаження сигналу ЕКГ з перешкодою (файл ecg2x60.dat) 
ecg=load('ecg2x60.dat');

%=== Завдання #4.2 ===
% Фільтрація сигналу адаптивним фільтром

fs = 200 ; f = 60 ;
t = (0:length(ecg)-1)/fs ;
d =  [cos(2*pi*f*t); sin(2*pi*f*t)];		% опорний сигнал
mu = 0.1 ;
[y,e,w] = lms60(ecg,d,mu);

% Графіки результату фільтрації
figure(1)
subplot(311), plot(t,e), xlim([0,2]), title ('Відфільтрований сигнал'), xlabel('t'), ylabel('e'); 
subplot(312), plot(t,ecg), xlim([0,2]), title ('Початковий сигнал з шумом'), xlabel('t'), ylabel('ecg'); 
subplot(313), plot(t,y), xlim([0,2]), title ('Вихідний сигнал адаптивного фільтру'), xlabel('t'), ylabel('y'); 

%=== Завдання #4.3 ===
% Визначення значення коефіцієнтів адаптивного фільтру після закінчення адаптації

%=== Завдання #4.4 ===
% Дослідження залежності часу адаптації від коефіцієнта адаптації
figure(2)
mu = 0.000001 ;
[y,e,w] = lms60(ecg,d,mu);

subplot(511), plot(t,e), xlim([0,2]), title ('Відфільтрований сигнал, mu = 0.000001'), xlabel('t'), ylabel('y'); 
mu = 0.00001 ;
[y,e,w] = lms60(ecg,d,mu);


subplot(512), plot(t,e), xlim([0,2]), title ('Відфільтрований сигнал, mu = 0.00001'), xlabel('t'), ylabel('x'); 
mu = 0.0001 ;
[y,e,w] = lms60(ecg,d,mu);
subplot(513), plot(t,e), xlim([0,2]), title ('Відфільтрований сигнал, mu = 0.0001 ;'), xlabel('t'), ylabel('s'); 
mu = 0.001 ;
[y,e,w] = lms60(ecg,d,mu);
subplot(514), plot(t,e), xlim([0,2]), title ('Відфільтрований сигнал, mu = 0.001 ;'), xlabel('t'), ylabel('s'); 
mu = 0.1 ;
[y,e,w] = lms60(ecg,d,mu);
subplot(515), plot(t,e), xlim([0,2]), title ('Відфільтрований сигнал, mu = 0.01 ;'), xlabel('t'), ylabel('s'); 
