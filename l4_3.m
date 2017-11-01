clc
clear
close all
%=== Завдання #3.1 ===
% Моделювання досліджуваного сигналу
fs =  200; N =  4000; 
t=(0:length(x)-1)/fs;
s1=sin(2*pi*10*t);
s2=sin(2*pi*20*t);
s=[s1 s2];
v=2*randn(size(t));
x=s+v;
