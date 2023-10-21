function [koordinate_tock_vse, koordinate_tock_notr, koordinate_tock_zuni] = mcc_pi(r, st_tock)
% Izpis koordinat točk

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

fprintf('koordinate vseh točk :\n'), disp(koordinate_tock_vse)
fprintf('koordinate točk znotraj kroga:\n'), disp(koordinate_tock_notr)
fprintf('koordinate točk zunakj kroga:\n'), disp(koordinate_tock_zuni)
end