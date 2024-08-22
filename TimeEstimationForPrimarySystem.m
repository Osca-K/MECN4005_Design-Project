clear;
clc;

% Given parameters
k = 1500; % Spring constant (N/m)
c = 150; % Damping coefficient (Ns/m)
m = 1200; % Mass (kg)

% Calculate Natural Frequency (omega_n) and Damping Ratio (zeta)
omega_n = sqrt(k / m);
zeta = c / (2 * sqrt(k * m));
omega_d = omega_n * sqrt(1 - zeta^2);

% Calculate Rise Time (t_r)
t_r = (pi - acos(zeta)) / omega_d;

% Calculate Peak Time (t_p)
t_p = pi / omega_d;

% Calculate Maximum Peak (M_p)
M_p = exp(-zeta * pi / sqrt(1 - zeta^2));

% Calculate Settling Time (t_s) for 2% criterion
t_s = 4 / (zeta * omega_n);

% Display the results
fprintf('Natural Frequency (omega_n): %.2f rad/s\n', omega_n);
fprintf('Damping Ratio (zeta): %.2f\n', zeta);
fprintf('Damped Natural Frequency (omega_d): %.2f rad/s\n', omega_d);
fprintf('Rise Time (t_r): %.2f seconds\n', t_r);
fprintf('Peak Time (t_p): %.2f seconds\n', t_p);
fprintf('Maximum Peak (M_p): %.2f (relative to final value)\n', M_p);
fprintf('Settling Time (t_s): %.2f seconds\n', t_s);
