clc
clear
close all
%=== �������� #1.1 ===
% ����������� ������������� ����������� �������
fs = 200; 
f0 =  5;
A =  0.5;
D =  0.25;
N =  500;
t = (0:(N-1))/fs ;		% ������ ����
v =D*randn(1,N)  ; 
s =  A*cos(2*pi*f0*t);
x =  s+v;
% ������� ��������� �������
figure(1)
subplot(311), plot(t,v), xlim([0,2]), title ('����� ���'), xlabel('t'), ylabel('y'); 
subplot(312), plot(t,x), xlim([0,2]), title ('���������� ������ � �����'), xlabel('t'), ylabel('x'); 
subplot(313), plot(t,s), xlim([0,2]), title ('���������� ������ ��� ����'), xlabel('t'), ylabel('s'); 


%=== �������� #1.2 ===
% ���������� ������ ������� ����, ������� ������� �� ��������� ���/������
fprintf('��������� ������� - %s\n', var(x))
fprintf('��������� ���� - %s\n', var(v))
fprintf('��������� ���/������ - %s\n', var(v)/var(x))

%=== �������� #1.3 ===
% ���������� �������� ������ ��� �������������� �������  
maxlag = fix(x);
[r, lags]=xcorr(maxlag,'unbiased');
figure(2)
plot(lags, r)
xlim([-500 500])
%=== �������� #1.4 ===
% ���������� ������ ������ ��� �������������� �������  
[r, lags]=xcorr(maxlag,'biased');
figure(3)
plot(lags, r)
xlim([-500 500])

%=== �������� #1.5 ===
% ���������� ������ ��� �������������� ������� ��� �������� ��������� ������� 
N = 10000;
t = (0:(N-1))/fs ;		% ������ ����

v =D*randn(1,N)  ; 
s =  A*cos(2*pi*f0*t);
x =  s+v;
maxlag = fix(x);
[r, lags]=xcorr(maxlag,'unbiased');
figure(4)
plot(lags, r)
xlim([-10000 10000])

