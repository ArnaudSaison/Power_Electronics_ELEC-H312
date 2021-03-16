clear; clc;

% réglage des composants
R_i = 1e-6;
V_b = 200;

R_ch = 0.2;
L_ch = 10e-3;
E_ch = -140;

f_sw = 2e3;

% Réglage des configuration parameters
tolerance = 1e-4;
max_step_size = 1/f_sw/50;
stop_time = 1; % s

% Régalge de l'IGBT
I_ref = -50 % A
V_AB_ref = E_ch + R_ch * I_ref

% Calculs pour B2 a b c d
D = (1 + V_AB_ref/V_b)/2

Delta_V_max = max(abs(V_AB_ref), abs(V_b - abs(V_AB_ref)));
Detla_T_max = D/f_sw;

Delta_I_pp = Delta_V_max * Detla_T_max / L_ch

% Calculs pour B2 e



sim('Simulation_H_bridge')