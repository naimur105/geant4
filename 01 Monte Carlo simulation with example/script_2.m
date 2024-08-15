N = 100000;  % Number of random points per trial
num_trials = 100000;  % Number of trials to perform
pi_estimates = zeros(num_trials, 1);  % Array to store Pi estimates

for i = 1:num_trials
    x = rand(N, 1) * 2 - 1;
    y = rand(N, 1) * 2 - 1;
    inside_circle = x.^2 + y.^2 <= 1;
    pi_estimates(i) = 4 * sum(inside_circle) / N;
end

figure;
histogram(pi_estimates, 30, 'Normalization', 'pdf');
hold on;

% Overlay a Gaussian (Normal) distribution
mu = mean(pi_estimates);
sigma = std(pi_estimates);
x_values = linspace(min(pi_estimates), max(pi_estimates), 100);
y_values = normpdf(x_values, mu, sigma);
plot(x_values, y_values, 'r-', 'LineWidth', 2);

title('Distribution of Pi Estimates');
xlabel('Estimated Pi Value');
ylabel('Probability Density');
legend('Histogram of Pi Estimates', 'Gaussian Fit');
hold off;
