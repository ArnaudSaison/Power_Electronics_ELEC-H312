close all; clear; clc;

% =========================================================================
% Paramètres
% =========================================================================
% paramètres de la simulation
R = 20*2; % Ohm
L = 75e-6; % H
C = 10e-6; % F

f_c = 1 / (2*pi*sqrt(L*C)); % Hz
tau_c = 1 / f_c; % s
D = 0.25; % pourcents
f_s = 100e3; % Hz
T_s = 1 / f_s; % s
V_i = 12; % V

% paramètres de la caractéristique
R_vect = sort([logspace(1.3,3.2,20) linspace(10,25,20)]); % vecteur contenant toutes les valeurs de résistances simulées
R_vect = R_vect(2:end); % la résistance ne peut pas être nulle dans la simulation

% temps
t_init_mean = T_s * 50; % temps auquel on commence à calculer la moyenne
t_end_sim = T_s * 140; % temps auquel la simulation se termine

% préparation
sim('simulink_buck_converter_simpli')
[t_init_found, t_init_i] = min(abs(vi.time - t_init_mean));

% =========================================================================
% Calculs
% =========================================================================

% Initialisation des vecteurs
I_vect = [];
V_vect = [];

% Boucle pour créer les vecteurs avec différentes valeurs de R
for i = R_vect
    R = i;
    sim('simulink_buck_converter_simpli') % simulation
    I_vect = [mean(vi.signals(1).values(t_init_i:end)) I_vect]; % courant moyen
    V_vect = [mean(vi.signals(2).values(t_init_i:end)) V_vect]; % tension moyenne
    
    %plot(vi.time, vi.signals(2).values); hold on;
end

% Normalisation des valeurs
V_vect = V_vect / V_i;
I_ref = V_i / (8 * L * f_s);
I_vect = I_vect / I_ref;

% =========================================================================
% Représentation graphique
% =========================================================================

figure;
plot(I_vect, V_vect, ...
     'LineStyle', '-', ...
     'LineWidth', 2, ...
     'Color', 'red');






