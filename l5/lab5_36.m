clc
clear
close all
%=== �������� #3.1 ===
% ������������ ������� ��� ���� (eeg1-f3.dat)
eege1 = load('eeg1-f3.dat');
eege1 = detrend(eege1);

% ������������ ������� ��� ���� (eeg1-f4.dat)
eege2 = load('eeg1-f4.dat');
eege2 = detrend(eege2);

fs = 100;
t = (0:length(eege1)-1)/fs ;
t2 = (0:length(eege2)-1)/fs ;
figure(1)

subplot(211), plot(t,eege1), xlim([0,5]), title (' ������ ��� ���� (eeg1-f3.dat)'), xlabel('t'), ylabel('eeg'); 
subplot(212), plot(t2,eege2),  title ('������ ��� ���� (eeg1-f4.dat)'), xlabel('t'), ylabel('eeg'); 

%=== �������� #3.2 ===
% �������� ����� ������� ��� �� t1 = 5,71 � �� t2 = 6,78 �
t1 = 4.13;
t2 = 4.96;
t3 = 1.3;
t4 = 2.2;
n1 = fix(t1*fs)+1;
n2 = fix(t2*fs)+1;
n3 = fix(t3*fs)+1;
n4 = fix(t4*fs)+1;

eege1= reshape(eege1,1,750);
eege2= reshape(eege2,1,length(eege2));

eege1=eege1(1,n1:n2);
eege2=eege2(1,n3:n4);
t1= t(1,n1:n2);
t2= t(1,n3:n4);
figure(2)
subplot(211), plot(t1,eege1), title (' ������ ��� ���� (eeg1-f3.dat), �� t1 = 4.13� �� t2 = 4.96�'), xlabel('t'), ylabel('eeg'); 
subplot(212), plot(t2,eege2), title ('������ ��� ���� (eeg1-f4.dat), �� t1 = 1.3� �� t2 = 2.2�'), xlabel('t'), ylabel('eeg'); 

%=== �������� #3.3 ===
% ���������� ��� ������� ���
maxlag = fix(length(eege2));
lgd = xcorr(eege1, eege2, maxlag);
figure(3)
plot(lgd);

%=== �������� #3.4 ===
% ���������� ������ ����������� �������� ������� ���
Sxx=abs(fft(lgd))/length(lgd);
Sxx=[Sxx(1),2*Sxx(2:end-1),Sxx(end)];
Sy = fft(lgd);
N = length(Sy);
f = (0:N-1)/N*fs;
figure(4)
plot(f, Sxx), title ('������ ����������� ��������'), xlabel('f'), ylabel('Sxx')

