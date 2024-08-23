% Parameters
M = 1; % Example value for M; replace with actual value if known
g = 9.81; % Acceleration due to gravity in m/s^2
m = 1200; % Mass in kg
t = 1.77; % Time in seconds

% Calculate constant term
constant_term = 0.5 * (m / t);

% Range of angles (in degrees)
angles = linspace(0, 39, 100000); % From 0 to 39 degrees

% Convert angles to radians for MATLAB trigonometric functions
angles_rad = deg2rad(angles);

% Calculate braking force for each angle
F_b = m * g * sin(angles_rad) + constant_term;

% Plotting
figure;
plot(angles, F_b, '--k', 'LineWidth', 1);
xlabel('Angle (degrees)', 'FontSize', 11, 'FontName', 'Times New Roman');
ylabel('Braking Force (N)', 'FontSize', 11, 'FontName', 'Times New Roman');


% Set the font size and font name for the axes
set(gca, 'FontSize', 11, 'FontName', 'Times New Roman');

% Prepare data for exporting to Excel
data = table(angles', F_b', 'VariableNames', {'Angle', 'BrakingForce'});

% Define the filename
filename = 'braking_force_data.xlsx';

% Write data to Excel
writetable(data, filename);

disp(['Data successfully written to ', filename]);
