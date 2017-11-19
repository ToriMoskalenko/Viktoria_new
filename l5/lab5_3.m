clc
clear
close all
%=== Завдання #3.1 ===
% Завантаження сигналу ЕЕГ файл (eeg1-o2.dat)
eege1 = load('eeg1-o2.dat');
eege1 = detrend(eege1);

% Завантаження сигналу ЕЕГ файл (eeg1-c3.dat)
eege2 = load('eeg1-c3.dat');
eege2 = detrend(eege2);

fs = 100;
t = (0:length(eege1)-1)/fs ;
figure(1)
subplot(211), plot(t,eege1), xlim([0,5]), title (' сигнал ЕЕГ файл (eeg1-o2.dat)'), xlabel('t'), ylabel('eeg'); 
subplot(212), plot(t,eege2), xlim([0,5]), title ('сигнал ЕЕГ файл (eeg1-c3.dat)'), xlabel('t'), ylabel('eeg'); 

%=== Завдання #3.2 ===
% Виділення епохи сигналів ЕЕГ від t1 = 5,71 с до t2 = 6,78 с
t1 = 5.71;
t2 = 6.78;
n1 = fix(t1*fs)+1
n2 = fix(t2*fs)+1

eege1= reshape(eege1,1,750);
eege2= reshape(eege2,1,750);

eege1=eege1(1,n1:n2);
eege2=eege2(1,n1:n2);
t1= t(1,n1:n2);
figure(2)
subplot(211), plot(t1,eege1), title (' сигнал ЕЕГ файл (eeg1-o2.dat), від t1 = 5,71с до t2 = 6,78с'), xlabel('t'), ylabel('eeg'); 
subplot(212), plot(t1,eege2), title ('сигнал ЕЕГ файл (eeg1-c3.dat), від t1 = 5,71с до t2 = 6,78с'), xlabel('t'), ylabel('eeg'); 

%=== Завдання #3.3 ===
% Обчислення ВКФ сигналів ЕЕГ
