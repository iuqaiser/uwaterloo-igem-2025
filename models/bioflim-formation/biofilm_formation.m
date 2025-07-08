function [] = biofilm_formation()
    % Langmuir attachment model for how bacteria stick to surfaces over time
    
    %% Parameters
    bacteria_concentration = 1e8;        % How many bacteria in the fluid (CFU/mL)
    binding_strength = 1e6;              % How well bacteria stick (higher = sticks better)
    max_attachment_sites = 1e10;         % Maximum bacteria that can attach
    simulation_time = 10;                % How long to simulate (hours)
    
    %% Time setup
    time = linspace(0, simulation_time, 100);  % Time points to calculate
    attached_bacteria = zeros(size(time));     % Storage for results
    
    %% Langmuir Model Calculation
    % This equation shows how bacteria fill up attachment sites over time
    % Formula: attached = max_sites * (K * C) / (1 + K * C)
    % Where: K = binding strength, C = bacteria concentration
    
    for i = 1:length(time)
        % Langmuir equation - like filling parking spots
        K = binding_strength;
        C = bacteria_concentration;
        
        % Fraction of sites filled
        fraction_filled = (K * C) / (1 + K * C);
        
        % Total attached bacteria
        attached_bacteria(i) = max_attachment_sites * fraction_filled;
    end
    
    %% Results
    fprintf('Simple Biofilm Formation Results:\n');
    fprintf('=================================\n');
    fprintf('Initial bacteria: %.1e CFU/mL\n', bacteria_concentration);
    fprintf('Final attached: %.1e bacteria\n', attached_bacteria(end));
    fprintf('Attachment efficiency: %.1f%%\n', ...
            attached_bacteria(end) / bacteria_concentration * 100);
    
    %% Plot
    figure;
    plot(time, attached_bacteria, 'r-', 'LineWidth', 2);
    xlabel('Time (hours)');
    ylabel('Attached Bacteria');
    title('Simple Biofilm Formation - Langmuir Model');
    grid on;
    
    % Add annotation
    text(simulation_time*0.6, attached_bacteria(end)*0.8, ...
         sprintf('Max: %.1e bacteria', attached_bacteria(end)), ...
         'FontSize', 12, 'BackgroundColor', 'white');
end