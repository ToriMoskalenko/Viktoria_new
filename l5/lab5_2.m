clc
clear
close all

%=== �������� #2.1 ===
% ������������ ������� ��� ���� (eeg1-p4.dat)
fs = 100;
eeg =load('eeg1-p4.dat');
eeg = detrend(eeg);
t = (0:length(eeg)-1)/fs ;
figure(1)
plot(t,eeg), title ('EE�'), xlabel('t'), ylabel('eeg'); 

%=== �������� #2.2 ===
% �������� ����� ������� ��� �� t1 = 4,7 � �� t2 = 5,8 �
t1 =  4.7;
t2 = 5.8;
n1 = fix(t1*fs)+1;
n2 =  fix(t2*fs)+1;
eeg= reshape(eeg,1,750);
eeg1=eeg(1,n1:n2);
t1= t(1,n1:n2);
figure(2)
plot(t1,eeg1), title ('EE� � �������� �� 4.7� �� 5.8�'), xlabel('t'), ylabel('eeg'); 

%=== �������� #2.3 ===
% ���������� �������� ������ ��� ������� ���
maxlag = fix(eeg);
[r, lags]=xcorr(maxlag,'unbiased');
figure(3)
plot(lags, r), title ('������ �������� ������ ��� ������� ���'), xlabel('lags'), ylabel('r')
xlim([-500 500])

%=== �������� #2.4 ===
% ���������� ���������� ������ �� �������� �������
 T=1/14*(5.79-4.7)
 v=1/T
 
 %=== �������� #2.5 ===
% ���������� ����������� �������� �������
Sxx=abs(fft(eeg))/length(eeg);
Sxx=[Sxx(1),2*Sxx(2:end-1),Sxx(end)];
Sy = fft(eeg);
N = length(Sy);
f = (0:N-1)/N*fs;
figure(4)
plot(f, Sxx), title ('������ ����������� ��������'), xlabel('f'), ylabel('Sxx')

%=== �������� #2.6 ===
% ������������ ������� ��� ���� (eeg1-f3.dat)
fs = 100;
eeg =load('eeg1-f3.dat');
eeg = detrend(eeg);
t = (0:length(eeg)-1)/fs ;
figure(5)
plot(t,eeg), title ('EE�'), xlabel('t'), ylabel('eeg'); 

% �������� ����� ������� ��� �� t1 = 4,2 � �� t2 = 4,96 �
t1 =  4.2;
t2 = 4.96;
n1 = fix(t1*fs)+1;
n2 =  fix(t2*fs)+1;
eeg= reshape(eeg,1,750);
eeg1=eeg(1,n1:n2);
t1= t(1,n1:n2);
figure(6)
plot(t1,eeg1), title ('EE� � �������� �� 4.2� �� 4.96�'), xlabel('t'), ylabel('eeg'); 


% ���������� �������� ������ ��� ������� ���
maxlag = fix(eeg);
[r, lags]=xcorr(maxlag,'unbiased');
figure(7)
plot(lags, r), title ('������ �������� ������ ��� ������� ���'), xlabel('lags'), ylabel('r')
xlim([-500 500])


% ���������� ���������� ������ �� �������� �������
 T=1/14*(4.96-4.2)
 v=1/T
 
% ���������� ����������� �������� �������
Sxx=abs(fft(eeg))/length(eeg);
Sxx=[Sxx(1),2*Sxx(2:end-1),Sxx(end)];
Sy = fft(eeg);
N = length(Sy);
f = (0:N-1)/N*fs;
figure(8)
plot(f, Sxx), title ('������ ����������� ��������'), xlabel('f'), ylabel('Sxx')