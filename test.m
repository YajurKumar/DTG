close all; clear; clc;

% Test Parameters
sampling_rates = [10, 100, 1000]; % Different sampling rates in Hz
temperatures = [20, 25, 30]; % Different temperatures in degrees Celsius
test_duration = 10; % Duration of the test in seconds

% True Angular Velocity Simulation
time = 0:0.01:test_duration; % Time vector for 100 Hz base sampling
true_angular_velocity = sin(2 * pi * 0.5 * time); % Sinusoidal angular velocity

% Create a single figure for all subplots
figure;

% Calculate the number of subplots needed
num_tests = length(sampling_rates) * length(temperatures);
num_rows = ceil(sqrt(num_tests));
num_cols = ceil(num_tests / num_rows);

% Running Tests
for i = 1:length(sampling_rates)
    for j = 1:length(temperatures)
        % Resampling the true angular velocity for the current sampling rate
        current_sampling_rate = sampling_rates(i);
        t_resampled = 0:(1/current_sampling_rate):test_duration;
        true_angular_velocity_resampled = interp1(time, true_angular_velocity, t_resampled, 'linear', 'extrap');
        
        % Calling the simulateDTGGyro function
        measured_angular_velocity = simulateDTG(true_angular_velocity_resampled, current_sampling_rate, temperatures(j));

        % Determine the position for the current subplot
        subplot_index = (i - 1) * length(temperatures) + j;
        subplot(num_rows, num_cols, subplot_index)

        % Plotting
        plot(t_resampled, true_angular_velocity_resampled, 'b', 'LineWidth', 1.5);
        hold on;
        plot(t_resampled, measured_angular_velocity, 'r--', 'LineWidth', 1.5);
        hold off;
        xlabel('Time (s)');
        ylabel('Angular Vel. (rad/s)');
        legend('True', 'Measured', 'Location', 'best');
        title(['SR: ', num2str(current_sampling_rate), ' Hz, Temp: ', num2str(temperatures(j)), '°C']);
        grid on;
    end
end

% Adjusting layout for overall figure
sgtitle('DTG Test Results');
