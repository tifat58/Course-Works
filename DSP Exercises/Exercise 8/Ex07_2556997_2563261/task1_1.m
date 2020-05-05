% Digital Signal Processing - Summer term 2018 (University of Saarland)
% Tutorial 7 - Task 1.1

% this code snippet implements the pre-emphasis filter

% HOW TO RUN:
% type the command `task1_1' into the console

% reinstanciate the environment
clear; close all;

% variables
point8   = load('point8.mat');
s_point8 = point8.point8;
f_point8 = 44100;

% apply the pre-emphasis filter
filtered_point8 = filter([1, 0.95], 1, s_point8);