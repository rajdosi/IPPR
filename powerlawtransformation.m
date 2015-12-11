clc
clear all
close all
a=imread('C:\Animesh\Image Processing\images\images\darkgray.jpg');     
imshow(a);
a = im2double(a);
b = 1*(a.^(0.5));
figure;
imshow(b);