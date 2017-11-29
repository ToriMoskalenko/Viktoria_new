clc
clear
close all

%=== Завдання #2.1 ===
% Завантаження сигналу ЕЕГ файл (eeg1-p4.dat)
fs = 100;
eeg =load('eeg1-p4.dat');
eeg = detrend(eeg);
t = (0:length(eeg)-1)/fs ;
figure(1)
plot(t,eeg), title ('EEГ'), xlabel('t'), ylabel('eeg'); 

%=== Завдання #2.2 ===
% Виділення епохи сигналу ЕЕГ від t1 = 4,7 с до t2 = 5,8 с
t1 =  4.7;
t2 = 5.8;
n1 = fix(t1*fs)+1;
n2 =  fix(t2*fs)+1;
eeg= reshape(eeg,1,750);
eeg1=eeg(1,n1:n2);
t1= t(1,n1:n2);
figure(2)
plot(t1,eeg1), title ('EEГ в інтервалі від 4.7с до 5.8с'), xlabel('t'), ylabel('eeg'); 

%=== Завдання #2.3 ===
% Обчислення незміщеної оцінки АКФ сигналу ЕЕГ
maxlag = fix(eeg);
[r, lags]=xcorr(maxlag,'unbiased');
figure(3)
plot(lags, r), title ('Графік незміщеної оцінки АКФ сигналу ЕЕГ'), xlabel('lags'), ylabel('r')
xlim([-500 500])

%=== Завдання #2.4 ===
% Обчислення середнього періоду та середньої частоти
 T=1/14*(5.79-4.7)
 v=1/T
 
 %=== Завдання #2.5 ===
% Обчислення спектральної щільності сигналу
Sxx=abs(fft(eeg))/length(eeg);
Sxx=[Sxx(1),2*Sxx(2:end-1),Sxx(end)];
Sy = fft(eeg);
N = length(Sy);
f = (0:N-1)/N*fs;
figure(4)
plot(f, Sxx), title ('Графік спектральної щільності'), xlabel('f'), ylabel('Sxx')

%=== Завдання #2.6 ===
% Завантаження сигналу ЕЕГ файл (eeg1-f3.dat)
fs = 100;
eeg =load('eeg1-f3.dat');
eeg = detrend(eeg);
t = (0:length(eeg)-1)/fs ;
figure(5)
plot(t,eeg), title ('EEГ'), xlabel('t'), ylabel('eeg'); 

% Виділення епохи сигналу ЕЕГ від t1 = 4,2 с до t2 = 4,96 с
t1 =  4.2;
t2 = 4.96;
n1 = fix(t1*fs)+1;
n2 =  fix(t2*fs)+1;
eeg= reshape(eeg,1,750);
eeg1=eeg(1,n1:n2);
t1= t(1,n1:n2);
figure(6)
plot(t1,eeg1), title ('EEГ в інтервалі від 4.2с до 4.96с'), xlabel('t'), ylabel('eeg'); 


% Обчислення незміщеної оцінки АКФ сигналу ЕЕГ
maxlag = fix(eeg);
[r, lags]=xcorr(maxlag,'unbiased');
figure(7)
plot(lags, r), title ('Графік незміщеної оцінки АКФ сигналу ЕЕГ'), xlabel('lags'), ylabel('r')
xlim([-500 500])


% Обчислення середнього періоду та середньої частоти
 T=1/14*(4.96-4.2)
 v=1/T
 
% Обчислення спектральної щільності сигналу
Sxx=abs(fft(eeg))/length(eeg);
Sxx=[Sxx(1),2*Sxx(2:end-1),Sxx(end)];
Sy = fft(eeg);
N = length(Sy);
f = (0:N-1)/N*fs;
figure(8)
plot(f, Sxx), title ('Графік спектральної щільності'), xlabel('f'), ylabel('Sxx')