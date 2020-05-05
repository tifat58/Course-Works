% Digital Signal Processing - Summer term 2018 (University of Saarland)
% Tutorial 7 - Task 2.1

% this code snippet implements a linear fitting function

% EXAMPLE USAGE:
% > data = [1, 2, 3, 4, 5; 1, 3, 2, 4, 5];
% > [a, b] = linear_fit(data);

% implement the `linear_fit' function
function [a b] = linear_fit(data)
    n = size(data, 2);
    mean_x = mean(data(1,:));
    mean_y = mean(data(2,:));
    a = sum((data(1,:)-mean_x) .* (data(2,:)-mean_y)) / sum((data(1,:)-mean_x).^2);
    b = mean_y - a * mean_x;
    
    scatter(data(1,:), data(2,:)); hold on;
    plot(data(1,:), a * data(1,:) + b);
end