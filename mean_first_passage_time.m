steps = [1, -1];  % Possible steps in the random walk
N = 4;  %8 % Target position
num_runs = 10;  % Total number of trials
fpt = zeros(1, num_runs);  % Array to store the first passage times
tavg = 0;  % Initialize the sum of times

for i = 1:num_runs  % Run num_runs trials
    x = 0;  
    t = 0;  
    while x ~= N  
        random_choice = steps(randi(2));  
        x = x + random_choice;  
        t = t + 1;  
    end
    fpt(i) = t;  % Store the time taken to reach position N
    tavg = tavg + t;  % Accumulate the time for averaging
end 

% Display histogram of first passage times
figure;
histogram(fpt, 5);  
title('Histogram of First Passage Times');
xlabel('First Passage Time');
ylabel('Frequency');

% Display the average time across all trials
disp(tavg / num_runs);  
