%close all;

% =========================================================================
% Paramètres
% =========================================================================
% paramètres affichage
graph.t_init = 6.7e-4;
graph.t_end = 7e-4;

% paramètres graphiques
graph.epaisseur_ligne_fin = 2;
graph.epaisseur_ligne_epais = 3;

% courants
graph.couleur_iR = '#0000FF';
graph.couleur_iT = '#FF00FF';
graph.couleur_iD = '#FF0000';
graph.couleur_iL = '#00FFFF';
graph.couleur_iC = '#4DBEEE';

graph.ligne_iR = '-';
graph.ligne_iT = ':';
graph.ligne_iD = '--';
graph.ligne_iL = '-';
graph.ligne_iC = '-';

% tensions
graph.couleur_vR = '#0000FF';
graph.couleur_vT = '#FF13A6';
graph.couleur_vD = '#FF0000';

graph.ligne_vR = '-';
graph.ligne_vT = ':';
graph.ligne_vD = ':';

% préparation
[graph.t_init_found, graph.t_init_i] = min(abs(vi.time - graph.t_init));
[graph.t_end_found, graph.t_end_i] = min(abs(vi.time - graph.t_end));

% =========================================================================
% Représentation des courants
% =========================================================================
figure;
set(gcf,'position',[2700,0,1000,750]);
subplot(2,1,1)

plot(vi.time(graph.t_init_i:graph.t_end_i), vi.signals(1).values(graph.t_init_i:graph.t_end_i,1), ...
     'LineWidth', graph.epaisseur_ligne_epais , ...
     'Color', graph.couleur_iR, ...
     'LineStyle', graph.ligne_iR);
hold on;

plot(vi.time(graph.t_init_i:graph.t_end_i), vi.signals(1).values(graph.t_init_i:graph.t_end_i,2), ...
     'LineWidth', graph.epaisseur_ligne_fin , ...
     'Color', graph.couleur_iT, ...
     'LineStyle', graph.ligne_iT);
hold on;

plot(vi.time(graph.t_init_i:graph.t_end_i), vi.signals(1).values(graph.t_init_i:graph.t_end_i,3), ...
     'LineWidth', graph.epaisseur_ligne_fin , ...
     'Color', graph.couleur_iD, ...
     'LineStyle', graph.ligne_iD);
hold on;

plot(vi.time(graph.t_init_i:graph.t_end_i), vi.signals(1).values(graph.t_init_i:graph.t_end_i,4), ...
     'LineWidth', graph.epaisseur_ligne_fin , ...
     'Color', graph.couleur_iL, ...
     'LineStyle', graph.ligne_iL);
hold on;

plot(vi.time(graph.t_init_i:graph.t_end_i), vi.signals(1).values(graph.t_init_i:graph.t_end_i,5), ...
     'LineWidth', graph.epaisseur_ligne_fin , ...
     'Color', graph.couleur_iC, ...
     'LineStyle', graph.ligne_iC);
hold on;

% autres paramètres
legend('iR', 'iT', 'iD', 'iL', 'iC');
grid on;
set(gca, 'XLimSpec', 'Tight');

% =========================================================================
% Représentation des tensions
% =========================================================================
subplot(2,1,2)
plot(vi.time(graph.t_init_i:graph.t_end_i), vi.signals(2).values(graph.t_init_i:graph.t_end_i,1), ...
     'LineWidth', graph.epaisseur_ligne_epais , ...
     'Color', graph.couleur_vR, ...
     'LineStyle', graph.ligne_vR);
hold on;

plot(vi.time(graph.t_init_i:graph.t_end_i), vi.signals(2).values(graph.t_init_i:graph.t_end_i,2), ...
     'LineWidth', graph.epaisseur_ligne_fin , ...
     'Color', graph.couleur_vT, ...
     'LineStyle', graph.ligne_vT);
hold on;

plot(vi.time(graph.t_init_i:graph.t_end_i), vi.signals(2).values(graph.t_init_i:graph.t_end_i,3), ...
     'LineWidth', graph.epaisseur_ligne_fin , ...
     'Color', graph.couleur_vD, ...
     'LineStyle', graph.ligne_vD);
hold on;

% autres paramètres
legend('vR', 'vT', 'vD');
grid on;
set(gca, 'XLimSpec', 'Tight');

% =========================================================================
% Print
% =========================================================================
set(gcf, 'PaperPosition', [0 0 20 20])    % can be bigger than screen 
set(gcf, 'PaperSize', [20 20])    % Same, but for PDF output
print(gcf, 'MyFigure.pdf', '-dpdf', '-r300' ); 