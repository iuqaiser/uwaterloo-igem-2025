function [dLdt] = biofilm_detachment_rate(time, L)
    growth_velocity = 2.78 * 10^(-2) % m/s, should be function of biofilm thickness later
   
    detachment_coefficient = 100
    shear_stress = 1 % Pa
    biofilm_density = 1000
    EPS = 0.8

    surface_detachment_rate = (detachment_coefficient * shear_stress * L^2)/((biofilm_density * EPS)^0.035)
    
    SOLR = 10 % gCOD.m^-2.d^-1
    detachment_period = 1e-2 * SOLR
    constant_volume_detachment_rate = 8

    time_dependent_detachment_coefficient = constant_volume_detachment_rate * cos((pi*time/7200)^(4000 * detachment_period^2))
    basal_layer_thickness = 1e-6
    volume_detachment_rate = time_dependent_detachment_coefficient * max(0, L - basal_layer_thickness)
    
    dLdt = growth_velocity - surface_detachment_rate - volume_detachment_rate
end

tspan = [0 2*86400]

L0 = 5e-6 %m
dLdt = zeros(size(t))

[time, L] = ode45(@biofilm_detachment_rate, tspan, L0)

plot(t/3600, L, 'LineWidth', 2)
xlabel('Time [hours]')
ylabel('biofilm_thickness')
title('Net Biofilm Thickness Change Rate Over Time')
grid on