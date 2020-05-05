% Digital Signal Processing - Summer term 2018 (University of Saarland)
% Tutorial 7 - Task 2.2

% this code snippet performs a linear function fitting

% HOW TO RUN:
% type the command `task2_2' into the console

% reinstanciate the environment
clear; close all;

% variables
data = [2.1,   2.2,   2.4,   2.6,   2.7,   2.8,   2.9,   3.0,   3.1,    3.3,    3.5,    3.7;
        0.425, 0.351, 0.281, 0.288, 0.137, 0.163, 0.084, 0.047, 0.013, -0.048, -0.099, -0.0142];
    
% call the defined `linear_fit' function
[a, b] = linear_fit(data)