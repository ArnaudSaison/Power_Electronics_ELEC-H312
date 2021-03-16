clear; clc;
% ==================== A1 ====================
% Batterie
R_i = 1e-6; % Ohms
V_b = 200; % V

f_sw = 2e3; % Hz
max_step_size = 1/f_sw/50; % s
tolerance = 1e-4;

short_circuit_current = V_b / R_i % A -> high enough to be ~ infty

% RLE
RLE_R = 0.2; % Omhs
RLE_L = 10e-3; % H
RLE_E = 140; % V

RLE_tau = RLE_L / RLE_R % s
stop_time_nb = 10; % /
stop_time = RLE_tau * stop_time_nb; % s

% A12a+b
I_ref = +50; % A wanted current
V_ref = RLE_E + RLE_R * I_ref % V voltage we should have to obtain I_ref

V_AN_ref = V_ref; % V

% PWM
PWM_period = 1/f_sw; % s

% ==================== A2 ====================
D = V_AN_ref / V_b; % Duty cycle required to obtain V_AN_ref
D_ref = D * 100;

Delta_I_pp = (1 - D) * D * V_b / (f_sw * RLE_L) % A

% ==================== A3 ====================
Dead_time = 10e-6
% max_step_size = Dead_time/5; % s spécialement pour le A3
% % D_ref = 25;
% 
% V_aN_temps_mort = (D - sign(I_ref) * Dead_time * f_sw) * V_b
% 
% V_AN_consigne_temps_mort = 126; % V
% V_AN_ref = V_AN_consigne_temps_mort;
% D = V_AN_consigne_temps_mort / V_b;
% D_ref = D * 100; 

% ==================== A4 ====================


% ==================== A5 ====================




sim('PEs_312_201819_sim_hacheurs_demi_pont_A_ACHEVER_2018a')





