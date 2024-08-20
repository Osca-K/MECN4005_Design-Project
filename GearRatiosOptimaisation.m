
clear
clc

GW_RPM = 382; % RPM of the wheel gear
max_radius = 0.3; % Maximum radius for pulleys and gears (in meters)

%radius ranges for the intermediate and motor pulleys
radius_range = linspace(0.01, max_radius, 100); % Avoid 0 to prevent division by zero

%Motor RPM for fixed motor pulley radii
fixed_motor_radius = [0.1, 0.2, 0.3]; % My  fixed motor pulley radii
line_styles_motor = {'-', '--', '-.'}; % Solid, Dashed, Dash-Dot


figure;
hold on;

%  Motor RPM vs. Intermediate Pulley Radius
for idx = 1:length(fixed_motor_radius)
    r_motor = fixed_motor_radius(idx);
    motor_RPM_fixed_motor = GW_RPM * (radius_range / r_motor);
    plot(radius_range, motor_RPM_fixed_motor, ...
         line_styles_motor{idx}, ...
         'DisplayName', sprintf('Motor Pulley Radius = %.2f m', r_motor), ...
         'LineWidth', 1.5);
end

% Motor RPM vs. Motor Pulley Radius here
fixed_intermediate_radius = [0.1, 0.2, 0.3]; %My fixed radius options for int gear
line_styles_intermediate = {'-.', ':', '-.'}; 

for idx = 1:length(fixed_intermediate_radius)
    r_int = fixed_intermediate_radius(idx);
    motor_RPM_fixed_intermediate = GW_RPM * (r_int ./ radius_range);
    plot(radius_range, motor_RPM_fixed_intermediate, ...
         line_styles_intermediate{idx}, ...
         'DisplayName', sprintf('Intermediate Pulley Radius = %.2f m', r_int), ...
         'LineWidth', 1.5);
end


xlabel('Pulley Radius (m)', 'FontSize', 11, 'FontName', 'Times New Roman');
ylabel('Motor RPM', 'FontSize', 11, 'FontName', 'Times New Roman');

legend('FontSize', 11, 'FontName', 'Times New Roman');
grid on;
hold off;
