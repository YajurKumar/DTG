# Dynamically Tuned Gyroscope Sensor Simulation

This MATLAB repository contains the `simulateDTG` function, which is designed to simulate the behavior of a Dynamically Tuned Gyroscope (DTG) sensor typically used in satellite navigation systems. The function incorporates realistic features such as noise, bias drift, temperature dependency, and saturation effects to provide a comprehensive emulation of a DTG sensor.

## Features

- **Realistic Noise Simulation**: Incorporates Gaussian noise to emulate measurement errors.
- **Bias Drift**: Simulates the bias drift over time, accounting for random variations.
- **Temperature Dependency**: Models the effect of temperature changes on sensor performance.
- **Saturation and Dead Zone**: Implements realistic limitations on the gyroscope's measurement capabilities.
- **Versatile Testing**: Accommodates various sampling rates and operating temperatures for thorough testing and simulation.

## Usage

To use this function, provide the true angular velocity (in radians per second), the sampling rate of the gyroscope (in Hz), and the operating temperature (in degrees Celsius). The function returns the gyroscope's measured angular velocity, simulating the behavior of a real DTG sensor.

```matlab
measured_angular_velocity = simulateDTG(true_angular_velocity, sampling_rate, temperature);
```

### Parameters:

- `true_angular_velocity`: Vector of true angular velocity (rad/s).
- `sampling_rate`: The sampling rate of the gyroscope (Hz).
- `temperature`: Operating temperature (°C).

### Returns:

- `measured_angular_velocity`: Simulated gyroscope's measured angular velocity.

## Example

An example script to test the `simulateDTG` function is provided in `test.m`. This script generates a test scenario with varying sampling rates and temperatures to evaluate the function's performance.

## Plotting

The function generates plots to visualize the true and measured angular velocities, facilitating easy comparison and analysis of the simulation results.

## Contributing

Contributions to this project are welcome. Please ensure that any pull requests or issues are detailed with sufficient information to understand your changes or concerns.

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Acknowledgments

- This project is inspired by the need for accurate sensor simulations in satellite navigation research.
- Thanks to all contributors who have helped to improve this simulation tool.
