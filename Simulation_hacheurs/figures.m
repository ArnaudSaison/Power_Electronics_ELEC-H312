
print_figures.H = 10;
print_figures.L = 20;
margin = 0;
name = 'b2e.pdf'

set(gcf, 'PaperPosition', [margin/2 margin/2 print_figures.L print_figures.H])
set(gcf, 'PaperSize', [print_figures.L+margin (print_figures.H+margin)/1])
%get(gca,'OuterPosition')
print(gcf, name, '-dpdf', '-r300' );