% Set the number of random points to generate
N = 100000;  % Number of random points
count_inside_circle = 0;

% Generate random (x, y) points within the square where both x and y range from -1 to 1.

x = rand(N, 1) * 2 - 1;
y = rand(N, 1) * 2 - 1;

inside_circle = x.^2 + y.^2 <= 1;
count_inside_circle = sum(inside_circle);

pi_estimate = 4 * count_inside_circle / N;

figure;
hold on;
% Plot points inside the circle in blue
plot(x(inside_circle), y(inside_circle), 'b.');
% Plot points outside the circle in red
plot(x(~inside_circle), y(~inside_circle), 'r.');
axis equal;
title(['Estimate of \pi: ', num2str(pi_estimate)]);

% Positioning the text in the figure
text(-1, -0.6, ['Points inside the square (total) N = ', num2str(N)], 'FontSize', 14, 'Color', 'k');
text(-1, -0.8, ['Points inside the circle = ', num2str(count_inside_circle)], 'FontSize', 14, 'Color', 'k');
% text(-1, 0.8, ['\pi Estimate = ', num2str(pi_estimate)], 'FontSize', 12, 'Color', 'k');

hold off;
