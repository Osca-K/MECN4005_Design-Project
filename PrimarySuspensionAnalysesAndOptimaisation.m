
clear
clc

% MATLAB Script to Plot System Response for Different k and c Values

% System Parameters
m = 1200; % Mass (kg)
A = 0.03; % Amplitude as estimated using the rack rail height
omega = 1; % Arbitary chosen valuue for simplifying analysis (rad/s)

% Define ranges for k and c
k_values = [1000, 1500]; % Spring constants (N/m)
c_values = [ 100, 150]; % Damping coefficients (Ns/m)

% Time vector
t = linspace(0, 10, 1000); % Time from 0 to 60 seconds (Desired to settle within a minutes if possibel


figure;
hold on;

% Loop over different k and c values
for k = k_values
    for c = c_values
        % Natural Frequency and Damping Ratio
        omega_n = sqrt(k / m);
        zeta = c / (2 * sqrt(k * m));
        omega_d = omega_n * sqrt(1 - zeta^2);

        % System response calculation
        % Input: A*sin(omega*t) >>Because it is simillar to sinwave which is being used to model the vibration on the wheel so its still acceptable to do so
        % Response: use the impulse response for simplicity
       
        
        % Impulse Response (for illustration)
        sys = tf([1], [m, c, k]); % Transfer function H(s) = 1 / (ms^2 + cs + k)
        [y, t] = step(sys, t); % Response to unit step input
        
        % Plot
        plot(t, y, 'DisplayName', sprintf('k=%.1f, c=%.1f', k, c));
    end
end



xlabel('Time (s)');
ylabel('Response');
legend('show');
grid on;
hold off;
