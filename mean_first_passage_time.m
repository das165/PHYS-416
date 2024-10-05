steps = [1, -1];
N = 4;  % Target position
fpt = zeros(1, num_runs);  % Array to store the times
tavg = 0;

    for i = 1:1000  % Run 1000 trials for each simulation
        x = 0;
        t = 0;
        while x ~= N
            random_choice = steps(randi(2));
            x = x + random_choice;
            t = t + 1;
        end
        fpt(i) = t;
        tavg = tavg + t;
    end 
    

% Display histogram of all averages
figure;
histogram(fpt); 
title('Histogram of First Passage Time Averages');
xlabel('First Passage Time');
ylabel('Frequency');

disp(tavg/1000);