clc
clear
close all
%=== Завдання #1.1 ===
% Моделювання стаціонарного випадкового процесу
fs = 200; 
f0 =  5;
A =  0.5;
D =  0.25;
N =  1000;
t = (0:(N-1))/fs ;		% вектор часу
v =D*randn(1,N)  ; 
s =  A*cos(2*pi*f0*t);
x =  s+v;
% Графіки отриманих сигналів
figure(1)
subplot(311), plot(t,v), xlim([0,5]), title ('Білий шум'), xlabel('t'), ylabel('y'); 
subplot(312), plot(t,x), xlim([0,5]), title ('Початковий сигнал з шумом'), xlabel('t'), ylabel('x'); 
subplot(313), plot(t,s), xlim([0,5]), title ('Початковий сигнал без шуму'), xlabel('t'), ylabel('s'); 


%=== Завдання #1.2 ===
% Обчислення оцінки дисперсії шуму, дисперсії сигналу та відношення шум/сигнал
fprintf('Дисперсия сигнала - %s\n', var(x))
fprintf('Дисперсия шума - %s\n', var(v))
fprintf('Отношение шум/сигнал - %s\n',snr(s,v))

%=== Завдання #1.3 ===
% Обчислення незміщеної оцінки АКФ змодельованого процесу  
maxlag = fix(0.1*length(x));
[r, lags] = xcorr(x, maxlag, 'unbiased');
figure(2)
plot(lags, r); 

%=== Завдання #1.4 ===
% Обчислення зміщеної оцінки АКФ змодельованого процесу  
maxlag = fix(0.9*length(x));
[r, lags]=xcorr(x,maxlag,'biased');
figure(3)
plot(lags, r)


%=== Завдання #1.5 ===
% Обчислення оцінки АКФ змодельованого процесу при збільшенні тривалості процесу 

t = 0:100; 	% вектор часу

maxlag = fix(0.3*length(x));
[r, lags] = xcorr(x, maxlag, 'unbiased');
figure(4)
plot(lags, r); 


[r, lags]=xcorr(x,maxlag,'biased');
figure(5)
plot(lags, r)



t = 0:1000; 	% вектор часу

maxlag = fix(0.3*length(x));
[r, lags] = xcorr(x, maxlag, 'unbiased');
figure(6)
plot(lags, r); 


[r, lags]=xcorr(x,maxlag,'biased');
figure(7)
plot(lags, r)

