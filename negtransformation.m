clc
clear all
close all
a=imread('C:\Animesh\Image Processing\images\images\lena.gif');     
imshow(a);
b = 255-a;
figure;
imshow(b);
