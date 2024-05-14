% Parameters
n1 = 1.445; % Refractive index of the core
n2 = 1.46;  % Refractive index of the cladding
d = 10e-6;  % Core diameter in meters
lambda = 1.55e-6; % Laser wavelength in meters
m = 0; % Given mode

% Convert angles from degrees to radians for calculation
theta_min = 0.1 * (pi/180); % 0.1 degree in radians
theta_max = 1.74 * (pi/180); % 1.74 degrees in radians

% Define theta range for plotting
theta = linspace(theta_min, theta_max, 1000); % A dense range of angles for a smooth plot

% Calculate LHS of the equation
LHS = tan(theta) .* sin(theta);

% Calculate RHS of the equation
RHS = (2 * pi * d / lambda) .* sqrt(n1^2 - n2^2) ./ sin(theta);

% Plot LHS and RHS
plot(theta, LHS, 'b', theta, RHS, 'r');
xlabel('Theta (radians)');
ylabel('Values');
legend('LHS','RHS');
title('Plot of the mode equation');

% Find the number of crossing points within the specified range
% This will be where LHS - RHS changes sign, indicating an intersection
crossings = sum(diff(LHS - RHS > 0));

% Display the number of crossing points
disp(['Number of possible laser angles that can propagate: ', num2str(crossings)]);
