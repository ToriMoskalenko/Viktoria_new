clc;
%=== �������� #2.1 ===
% ����������� ������������� �������

 fs =  200; N =  4000; 
 t = (0:(N-1))/fs ;		% ������ ����
 v =  2*randn(size(t));  
 s =sin(2*pi*10*t);
 x =  s+v;

%=== �������� #2.3 ===
% ������� ����������� �������. Գ�������� ������������� �������.
L = 128 ; mu = 0.0001 ;
[y,e,w] = lms(x,s,mu,L);
% ������� ���������� ����������
figure(1)
subplot(311), plot(y), xlim([1,400]), title ('³������������� ������'), xlabel('t'), ylabel('y'); 
subplot(312), plot(x), xlim([1,400]), title ('���������� ������ � �����'), xlabel('t'), ylabel('x'); 
subplot(313), plot(s), xlim([1,400]), title ('���������� ������ ��� ����'), xlabel('t'), ylabel('s'); 
% ----- ��� ����������� �������
n =  512;  % ������� �����, �� ��������������
figure(2)
a =  1;
[h,w]=freqz(b,a,n);
 mag = abs(h);
 plot(w/(2*pi)*fs,mag),title ('���'),grid on

 
 %=== �������� #2.4 ===
% ���������� ��������� ���� ��������� �� ����������� ���������
 mu = 0.000001 ;
[y,e,w] = lms(x,s,mu,L);
% ������� ���������� ����������
figure(3)
subplot(511), plot(y), xlim([1,400]), title ('³������������� ������, mu = 0.000001'), xlabel('t'), ylabel('y'); 
mu = 0.00001 ;
[y,e,w] = lms(x,s,mu,L);
subplot(512), plot(y), xlim([1,400]), title ('³������������� ������, mu = 0.00001'), xlabel('t'), ylabel('x'); 
mu = 0.0001 ;
[y,e,w] = lms(x,s,mu,L);
subplot(513), plot(y), xlim([1,400]), title ('���������� ������ ��� ����, mu = 0.0001 ;'), xlabel('t'), ylabel('s'); 
mu = 0.001 ;
[y,e,w] = lms(x,s,mu,L);
subplot(514), plot(y), xlim([1,400]), title ('���������� ������ ��� ����, mu = 0.001 ;'), xlabel('t'), ylabel('s'); 
mu = 0.01 ;
[y,e,w] = lms(x,s,mu,L);
subplot(515), plot(y), xlim([1,400]), title ('���������� ������ ��� ����, mu = 0.01 ;'), xlabel('t'), ylabel('s'); 


%=== �������� #2.5 ===
% ���������� ��������� ��������� ���������� ��� ���� ������ �������

L = 256 ; mu = 0.0001 ;
[y,e,w] = lms(x,s,mu,L);
% ������� ���������� ����������
figure(4)
subplot(311), plot(y), xlim([1,800]), title ('³������������� ������'), xlabel('t'), ylabel('y'); 
subplot(312), plot(x), xlim([1,400]), title ('���������� ������ � �����'), xlabel('t'), ylabel('x'); 
subplot(313), plot(s), xlim([1,400]), title ('���������� ������ ��� ����'), xlabel('t'), ylabel('s'); 



L = 512 ; mu = 0.0001 ;
[y,e,w] = lms(x,s,mu,L);
% ������� ���������� ����������
figure(5)
subplot(311), plot(y), xlim([1,1000]), title ('³������������� ������'), xlabel('t'), ylabel('y'); 
subplot(312), plot(x), xlim([1,400]), title ('���������� ������ � �����'), xlabel('t'), ylabel('x'); 
subplot(313), plot(s), xlim([1,400]), title ('���������� ������ ��� ����'), xlabel('t'), ylabel('s'); 

L = 1024 ; mu = 0.0001 ;
[y,e,w] = lms(x,s,mu,L);
% ������� ���������� ����������
figure(6)
subplot(311), plot(y), xlim([1,1200]), title ('³������������� ������'), xlabel('t'), ylabel('y'); 
subplot(312), plot(x), xlim([1,400]), title ('���������� ������ � �����'), xlabel('t'), ylabel('x'); 
subplot(313), plot(s), xlim([1,400]), title ('���������� ������ ��� ����'), xlabel('t'), ylabel('s'); 

