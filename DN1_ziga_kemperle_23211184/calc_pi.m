% 21.10. 2023, 16:30

% Izračun približne vrednosti števila π s pomočjo metode Monte Carlo.
clc, clearvars, close all

% Parametri
st_tock = 10000;
r = 1;


%popravi%%%%%%%tolele morm zj dt v funkcijo nekak tkole: mcc_pi(st_tock, r)

x = 2 * r * rand(st_tock, 1) - r;   % določi random x koordinate znotraj
                                    % območja kvadrata
y = 2 * r * rand(st_tock, 1) - r;   % določi random y koordinate znotraj
                                    % območja kvadrata

tocke_notr = x .^2 + y.^2 <= r^2;
tocke_zuni = x .^2 + y.^2 > r^2;

st_tock_notr =  sum(tocke_notr);    % seštevek točk znotraj kroga
st_tock_zuni = st_tock - st_tock_notr;    % seštevek točk zunaj kroga


% Izpis koordinat
koordinate_tock_vse = [x, y];
koordinate_tock_notr = [x(tocke_notr), y(tocke_notr)];
koordinate_tock_zuni = [x(tocke_zuni), y(tocke_zuni)];

%fprintf('koordinate vseh točk :\n'), disp(koordinate_tock_vse)
%fprintf('koordinate točk znotraj kroga:\n'), disp(koordinate_tock_notr)
%fprintf('koordinate točk zunakj kroga:\n'), disp(koordinate_tock_zuni)

% anonimna funkcija za kvadrat
kvadrat = @(x, y) (abs(x) <= r/2 & abs(y) <= r/2);

kvadrat_x = [-r, r, r, -r, -r];
kvadrat_y = [-r, -r, r, r, -r];


% Grafični prikaz

plot(x(tocke_notr), y(tocke_notr), '.g')
hold on

plot(x(tocke_zuni), y(tocke_zuni), 'rx')
hold on

krog(r)
hold on
plot(kvadrat_x, kvadrat_y, 'k', 'LineWidth', 2);

title('Graf naključno generiranih točk za izračun približka \pi')
legend('točke v krogu', 'točke zunaj kroga', 'krožni lok')
axis equal
xlabel 'x'
ylabel 'y'


% Izpis vrednosti
pi_priblizno = 4 * st_tock_notr / st_tock;
napaka = abs(pi_priblizno - pi);
fprintf('Približna vrednost števila π :'), disp(pi_priblizno)
fprintf('Napaka metode :'), disp(napaka)


% Funkcija za izris kroga
function krog(r)
    alpha = linspace(0, 2 * pi, 10000);
    x = r * cos(alpha);
    y = r * sin(alpha);
    plot(x, y, 'k', 'LineWidth', 2);
end