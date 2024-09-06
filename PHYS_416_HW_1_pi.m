m = 100; 
n_values = logspace(1, 6, 20); 
errors = zeros(size(n_values)); 
std_devs = zeros(size(n_values)); 


for idx = 1:length(n_values)
    n = round(n_values(idx)); 
    pi_estimates = zeros(1, m); 
    
    % Run m simulations for each n
    for j = 1:m
        vectors = 2 * rand(n, 2) - 1;
        count = 0;
        for i = 1:n
            magnitude = norm(vectors(i, :)); 
            if magnitude <= 1
                count = count + 1; 
            end
        end
        pi_estimate = (count / n) * 4;  % Calculate pi
        pi_estimates(j) = pi_estimate;  % Store pi 
    end
    
    average_pi = mean(pi_estimates);   % average of all pi estimates
    std_devs(idx) = std(pi_estimates); % standard deviation of pi estimates
    
    % Calculate error 
    errors(idx) = abs(average_pi - pi);
end

% Plot 
errorbar(n_values, errors, std_devs, '-o'); 
set(gca, 'XScale', 'log', 'YScale', 'log'); 
xlabel('n (Number of random points)');
ylabel('Absolute Error');
title('Error in Pi Estimation vs Number of Random Points with Error Bars');
grid on;
