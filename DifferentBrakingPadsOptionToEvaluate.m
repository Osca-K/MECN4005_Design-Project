% Given data
brake_force = 1936.29; % Brake force in Newtons

% Define the ranges of friction coefficients
mu_range_ceramic = linspace(0.3, 0.5, 100); % Range for Ceramic pads
mu_range_semi_metallic = linspace(0.35, 0.38, 100); % Range for Semi-Metallic pads
mu_range_organic = linspace(0.25, 0.55, 100); % Range for Organic pads

% Calculate the piston force for each friction coefficient
piston_force_ceramic = brake_force ./ mu_range_ceramic;
piston_force_semi_metallic = brake_force ./ mu_range_semi_metallic;
piston_force_organic = brake_force ./ mu_range_organic;

% Plot the results
figure;
hold on;

% Plot for Ceramic pads with solid line
plot(mu_range_ceramic, piston_force_ceramic, 'k--', 'LineWidth', 1.5, 'DisplayName', 'Ceramic Pads');

% Plot for Semi-Metallic pads with dashed line
plot(mu_range_semi_metallic, piston_force_semi_metallic+250, 'k-', 'LineWidth', 1.5, 'DisplayName', 'Semi-Metallic Pads');

% Plot for Organic pads with dotted line
plot(mu_range_organic, piston_force_organic-250, 'k:', 'LineWidth', 1.5, 'DisplayName', 'Organic Pads');

% Highlight the friction coefficient ranges
% fill([0.3 0.5 0.5 0.3], [0 max(piston_force_ceramic) max(piston_force_ceramic) 0], 'r', 'FaceAlpha', 0.1, 'EdgeColor', 'none');
% fill([0.35 0.38 0.38 0.35], [0 max(piston_force_semi_metallic) max(piston_force_semi_metallic) 0], 'g', 'FaceAlpha', 0.1, 'EdgeColor', 'none');
% fill([0.25 0.55 0.55 0.25], [0 max(piston_force_organic) max(piston_force_organic) 0], 'b', 'FaceAlpha', 0.1, 'EdgeColor', 'none');

% Formatting the plot
xlabel('Friction Coefficient','FontSize', 11, 'FontName', 'Times New Roman');
ylabel('Required Piston Force (N)','FontSize', 11, 'FontName', 'Times New Roman');

legend('show');
grid on;
hold off;
