% The rpopeties of the coil used in the evapoator and condensor of heating
% system units. Only Aluminium and Copper are consider
thermal_conductivity_aluminum = 237; % W/(m·K)
thermal_conductivity_copper = 401; % W/(m·K)

refrigerants = {'R22', 'R404A', 'R134a'};
boiling_points = [-40.80, -46.60, -26.30]; % Boiling points of refrigierent
temperature_range = -45.6:2; % The temperature range at K2 moutain (From -45.6°C to 2°C)


heat_aluminum = zeros(length(temperature_range), length(boiling_points));
heat_copper = zeros(length(temperature_range), length(boiling_points));

% Calculate the heat required to boil each refrigerant
for i = 1:length(boiling_points)
    boiling_point = boiling_points(i);
    for j = 1:length(temperature_range)
        ambient_temp = temperature_range(j);
        
        % Calculate heat for Aluminum
        delta_T =  ambient_temp-boiling_point;
        heat_aluminum(j, i) = thermal_conductivity_aluminum * delta_T; % Simplified model
        
        % Calculate heat for Copper
        heat_copper(j, i) = thermal_conductivity_copper * delta_T; % Simplified model
    end
end

% Plotting all in the same figure
figure;
hold on;



% Define line styles

line_styles={'-',':','--','-'};

% Plot for each refrigerant
for i = 1:length(boiling_points)
    % Aluminum with different line styles
    plot(temperature_range, heat_aluminum(:, i), line_styles{i}, 'LineWidth', 1.5, 'DisplayName', [refrigerants{i}, ' - Aluminum']);
    % Copper with different line styles
    plot(temperature_range, heat_copper(:, i), line_styles{i}, 'LineWidth', 1.5, 'DisplayName', [refrigerants{i}, ' - Copper']);
end

% Labels and formatting
xlabel('Ambient Temperature (°C)', 'FontName', 'Times New Roman', 'FontSize', 11);
ylabel('Heat Required (W/m^2)', 'FontName', 'Times New Roman', 'FontSize', 11);
%title('Heat Required to Boil Refrigerants vs Ambient Temperature', 'FontName', 'Times New Roman', 'FontSize', 11);
legend('show', 'FontName', 'Times New Roman', 'FontSize', 11);
grid on;
hold off;

% Set the font of the axes
set(gca, 'FontName', 'Times New Roman', 'FontSize', 11);
