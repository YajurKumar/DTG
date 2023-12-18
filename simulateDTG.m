function measured_angular_velocity = simulateDTG(true_angular_velocity, sampling_rate, temperature)
    % simulateDTGGyro Simulates a Dynamically Tuned Gyroscope (DTG) sensor.
    % 
    % Inputs:
    %   true_angular_velocity - Vector of true angular velocity in radians/second.
    %   sampling_rate - Sampling rate of the gyroscope in Hz.
    %   temperature - Operating temperature in degrees Celsius.
    %
    % Outputs:
    %   measured_angular_velocity - Simulated gyroscope's measured angular velocity.

    % Input Validation
    if nargin ~= 3
        error('simulateDTGGyro requires exactly three arguments: true_angular_velocity, sampling_rate, and temperature.');
    end
    if any(size(true_angular_velocity) == 0)
        error('true_angular_velocity cannot be an empty vector.');
    end
    if sampling_rate <= 0
        error('sampling_rate must be positive.');
    end

    % Constants and Parameters
    noise_base_level = 0.01; % Base level of noise
    noise_temperature_factor = 1e-4; % Factor by which noise increases with temperature
    initial_bias = 0.005; % Initial bias in radians/second
    bias_drift_rate = 1e-4; % Rate of bias drift per second
    max_measurement_range = 10; % Maximum measurable angular velocity (rad/s)
    dead_zone_threshold = 0.1; % Threshold below which gyroscope doesn't respond

    % Time vector
    dt = 1 / sampling_rate;
    t = 0:dt:(length(true_angular_velocity) - 1) * dt;

    % Bias and Scale Factor Drift
    bias_drift = initial_bias + bias_drift_rate * cumsum(randn(size(t))) * dt;
    scale_factor = 1 + 0.001 * randn(size(t)); % Slight random scale factor variation

    % Temperature-Dependent Noise
    noise_level = noise_base_level + noise_temperature_factor * abs(temperature - 25);
    noise = noise_level * randn(size(true_angular_velocity));

    % Gyroscope Measurement
    raw_output = scale_factor .* (true_angular_velocity + noise + bias_drift);

    % Saturation and Dead Zone
    raw_output = min(max(raw_output, -max_measurement_range), max_measurement_range); % Saturation
    measured_angular_velocity = raw_output .* (abs(raw_output) > dead_zone_threshold); % Dead zone
 
end
