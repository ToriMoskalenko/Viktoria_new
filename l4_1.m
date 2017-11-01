clc;
%=== �������� #1.1 ===
% ����������� ������������� �������
 fs =  200; N =  400; 
 t = (0:(N-1))/fs ;		% ������ ����
 v =  2*randn(size(t));  
 s =sin(2*pi*10*t)+sin(2*pi*20*t);
 x =  s+v;


%=== �������� #1.2 ===
 %������������ ������������ ������� ³���� �������� L=32
 L =  32; 			       % ������� �������
 b = wiener_hopf(x,s,L);	   % ���������� �����������

%=== �������� #1.3 ===
 %Գ�������� ������������� ������� 
 a = 1;
 y = filter(b,a,x);
figure(1)
subplot(311), plot(t,y), xlim([0,2]), title ('³������������� ������'), xlabel('t'), ylabel('y'); 
subplot(312), plot(t,x), xlim([0,2]), title ('���������� ������ � �����'), xlabel('t'), ylabel('x'); 
subplot(313), plot(t,s), xlim([0,2]), title ('���������� ������ ��� ����'), xlabel('t'), ylabel('s'); 

... 
% ------ ��� ������� ³����
 n = 512;  % ������� �����, �� ��������������
 figure(2)
 [h,w]=freqz(b,a,n);
 mag = abs(h);
 plot(w/(2*pi)*fs,mag),title ('���'),grid on
 dispersia_32=var(y)
 
  % L = 128
 L = 128; 			       % ������� �������
 b = wiener_hopf(x,s,L);	   % ���������� �����������
 y = filter(b,a,x);
figure(3)
subplot(311), plot(t,y), xlim([0,2]), title ('³������������� ������, L = 128'), xlabel('t'), ylabel('y'); 
subplot(312), plot(t,x), xlim([0,2]), title ('���������� ������ � �����, L = 128'), xlabel('t'), ylabel('x'); 
subplot(313), plot(t,s), xlim([0,2]), title ('���������� ������ ��� ����, L = 128'), xlabel('t'), ylabel('s'); 

% ------ ��� ������� ³����
 n = 512;  % ������� �����, �� ��������������
 figure(4)
 [h,w]=freqz(b,a,n);
 mag = abs(h);
 plot(w/(2*pi)*fs,mag),title ('���, L = 128'),grid on
 dispersia_128=var(y)
 
 
 % L = 256
 L = 256; 			       % ������� �������
  b = wiener_hopf(x,s,L);	   % ���������� �����������
 y = filter(b,a,x);
figure(5)
subplot(311), plot(t,y), xlim([0,2]), title ('³������������� ������, L = 256'), xlabel('t'), ylabel('y'); 
subplot(312), plot(t,x), xlim([0,2]), title ('���������� ������ � �����, L = 256'), xlabel('t'), ylabel('x'); 
subplot(313), plot(t,s), xlim([0,2]), title ('���������� ������ ��� ����, L = 256'), xlabel('t'), ylabel('s'); 

... 
% ------ ��� ������� ³����
 n = 512;  % ������� �����, �� ��������������
 figure(6)
 [h,w]=freqz(b,a,n);
 mag = abs(h);
 plot(w/(2*pi)*fs,mag),title ('���, L = 256'),grid on
 dispersia_256=var(y)
 
 
 
 % L = 64
 L = 64; 			       % ������� �������
 b = wiener_hopf(x,s,L);	   % ���������� �����������
 y = filter(b,a,x);
figure(7)
subplot(311), plot(t,y), xlim([0,2]), title ('³������������� ������, L = 64'), xlabel('t'), ylabel('y'); 
subplot(312), plot(t,x), xlim([0,2]), title ('���������� ������ � �����, L = 64'), xlabel('t'), ylabel('x'); 
subplot(313), plot(t,s), xlim([0,2]), title ('���������� ������ ��� ����, L = 64'), xlabel('t'), ylabel('s'); 

... 
% ------ ��� ������� ³����
 n = 512;  % ������� �����, �� ��������������
 figure(8)
 [h,w]=freqz(b,a,n);
 mag = abs(h);
 plot(w/(2*pi)*fs,mag),title ('���, L = 64'),grid on
 dispersia_64=var(y)