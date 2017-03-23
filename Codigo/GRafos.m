clc 
clear
hold off

% Define ligações
s = [1 1 1 2 2 3 3 4 5 5 6 7]; 
t = [2 4 8 3 7 4 6 5 6 8 7 8]; 

% q = [1 1 3 3 5 5 7 7 9 9 11 11 13 13 15 15 17 17 19 19 2 6 10 14 18 4 8 12 16 20];
% e = [2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 1 6 10 14 18 2 8 12 16 20 4];

% Pesos
weights = [10 10 1 10 1 10 1 1 12 12 12 12];
% weights = [10 10 1 10 1 10 1 1 12 12 12 12 9 2 5 7 12 14 9 1 3 2 24 12 14 10 12 1 2 3];
% weights = [10 10 1 10 10 10 1 10 1 10 1 1 12 12 12 12 9 2 5 7 12 14 9 1 3 2 24 12 14 10 12 1 2 3 1 10 1 1 10 10 1 10 1 10 1 1 12 12 12 12 9 2 5 7 12 14 9 1 3 2 24 12 14 10 12 1 2 3 12 12 12 12 9 2 5 7 12 14 9 1 3 2 24 12 14 10 12 1 2 3];

% Nomes
names = {'A' 'B' 'C' 'D' 'E' 'F' 'G' 'H'};

% Cria Grafo
G = graph(s,t,weights,names);
% G = graph(q,e,weights);
% G = graph(bucky);

% Plots
p = plot(G,'EdgeLabel',G.Edges.Weight);

% Menor distancia
tic
[caminho,distancia] = dijkstra(G,2,5);
Td = toc;
tic
[caminho2,distancia2] = floyd(G,2,5);
Tf = toc;

% Plot fresco
pause(1);
duo = caminho(1);
for i=1:(size(caminho,2)-1)
    duo = [duo caminho(i+1)];
    highlight(p, duo,'EdgeColor','r')
    pause(1);
end

figure(2)
c = categorical({'Floyd','Dijkstra'});
v = [Tf Td];
bar(c,v)


