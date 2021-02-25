clc;
% paramètres de la simulation
R = 40; % Ohm
L = 75e-6; % H
C = 10e-6; % F

f_c = 1 / (2*pi*sqrt(L*C)); % Hz
tau_c = 1 / f_c; % s
D = 0.25; % pourcents
f_s = 100e3; % Hz
T_s = 1 / f_s; % s
V_i = 12; % V

t_end_sim = T_s * 140;

sim('simulink_buck_converter')

% =========================================================================
% Calculs
% =========================================================================

% average output voltage
I_R = 0.003881; % mesure expérimentale
I_ref = V_i / (8 * L * f_s);
V_R = D^2 * V_i / (D^2 + 1/4 * I_R / I_ref)

% peak inductor current
I_Lmax = D * (V_i - V_R) / L / f_s

% deltas
Delta_1 = D * (V_i - V_R) / V_R
Delta_2 = 1 - D - Delta_1
