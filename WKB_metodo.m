%this file implements the calculation of the elements by the WKB method
%where one evaluates the tuttneling coefficient

%print it in rationals?
ra = 1;

%stampa il grafico
stampa = 0;

%ordine perturbativo a cui vogliamo calcolare la serie
n = 200;

%salvare il file
sa = 1;
loc = 'data/E_WKB.txt';

ter
E_WKB = zeros(n+1, 1);
E_WKB(1) = 0.5;

if sa ~= 0
    datafile = fopen(loc, 'w', 'n');
    fprintf(datafile, '%s\n', (E_WKB(1)));
end

for k=2:(n+1)
    E_WKB(k) = - sqrt(15/(2*pi^3)) .* (15/18)^(k-1) .* gamma(k - 1 + 1/2);
    
    if sa ~= 0
        fprintf(datafile, '%s\n', (E_WKB(k)));
    end
end
if sa ~= 0
    fclose(datafile);
end

if(ra == 1)
    disp(rats(E_WKB));
else
    disp(E_WKB);
end

if(stampa ~= 0)
    figure(1);
    plot(log(abs(E_WKB)), '.r');
    grid on, grid('minor');
    ylabel('log(|E_k|) '), xlabel('k'), title('E_k^0 perturbativo')
end