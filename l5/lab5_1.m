clc
clear
close all
%=== �������� #1.1 ===
% ����������� ������������� ����������� �������
fs = 200; 
f0 =  5;
A =  0.5;
D =  0.25;
N =  1000;
t = (0:(N-1))/fs ;		% ������ ����
v =D*randn(1,N)  ; 
s =  A*cos(2*pi*f0*t);
x =  s+v;
% ������� ��������� �������
figure(1)
subplot(311), plot(t,v), xlim([0,5]), title ('����� ���'), xlabel('t'), ylabel('y'); 
subplot(312), plot(t,x), xlim([0,5]), title ('���������� ������ � �����'), xlabel('t'), ylabel('x'); 
subplot(313), plot(t,s), xlim([0,5]), title ('���������� ������ ��� ����'), xlabel('t'), ylabel('s'); 


%=== �������� #1.2 ===
% ���������� ������ ������� ����, ������� ������� �� ��������� ���/������
fprintf('��������� ������� - %s\n', var(x))
fprintf('��������� ���� - %s\n', var(v))
fprintf('��������� ���/������ - %s\n',snr(s,v))

%=== �������� #1.3 ===
% ���������� �������� ������ ��� �������������� �������  
maxlag = fix(0.1*length(x));
[r, lags] = xcorr(x, maxlag, 'unbiased');
figure(2)
plot(lags, r); 

%=== �������� #1.4 ===
% ���������� ������ ������ ��� �������������� �������  
maxlag = fix(0.9*length(x));
[r, lags]=xcorr(x,maxlag,'biased');
figure(3)
plot(lags, r)


%=== �������� #1.5 ===
% ���������� ������ ��� �������������� ������� ��� �������� ��������� ������� 

t = 0:100; 	% ������ ����

maxlag = fix(0.3*length(x));
[r, lags] = xcorr(x, maxlag, 'unbiased');
figure(4)
plot(lags, r); 


[r, lags]=xcorr(x,maxlag,'biased');
figure(5)
plot(lags, r)



t = 0:1000; 	% ������ ����

maxlag = fix(0.3*length(x));
[r, lags] = xcorr(x, maxlag, 'unbiased');
figure(6)
plot(lags, r); 


[r, lags]=xcorr(x,maxlag,'biased');
figure(7)
plot(lags, r)

