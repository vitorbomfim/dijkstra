function [Caminho, Distancia] = dijkstra(G, origem, destino)

    % Entrada: Grafo G
    %          Origem da busca
    %          Destino da busca
    % Saída  : Um menor Caminho
    %          A Distancia mínima

Caminho = [destino]; % inicializa o vetor caminho
Distancia = []; % inicializa o vetor distancia

% criando a matriz dados
dist = (inf*(1:size(G.Nodes,1))'); % inicializa todas as distancias com infinito
preced = (0*(1:size(G.Nodes,1))'); % coluna que indica de onde veio 
dados = [(1:size(G.Nodes,1))' dist preced]; %concatena nó, distancia, e de onde veio

dados(origem,2) = 0; % distancia da origem a origem é zero
P_no = origem; % proximo no recebe origem (inicializacao)
memo = []; % memoria de Nós percorridos

while (1)
   
    atual = P_no; % Nó atual
    memo = [memo; dados(atual,:)]; % por onde ja passei
    
    vizinhos = neighbors(G,atual); % acha Nós vizinhos
        
    for i=1:size(vizinhos,1) % atribuir distancias
        if (dados(vizinhos(i),2) > dados(atual,2)+distances(G,atual,vizinhos(i)));
            dados(vizinhos(i),2) = dados(atual,2)+distances(G,atual,vizinhos(i));
            dados(vizinhos(i),3) = dados(atual,1);
        end
    end

    % Define o proximo Nó da busca
    vazio = dados; % cria uma matriz que pode ser alterada
    for l=1:size(memo,1)
        ind = find(vazio == memo(l,1)); % encontra elementos ja visitados
        vazio(ind(1),:) = []; % elimina elementos passados
    end
    [x,y] = min(vazio,[],1);
    %-----------------------------%
    % criterio de parada
    if (isempty(vazio))
        break
    else
        P_no = vazio(y(2),1); % escolhe proximo nó
    end
end

% Define menor caminho
    g = destino;
while (g ~= origem)
    o = find(memo == g);
    g = memo(o(1),3);
    Caminho = [Caminho g];
end
    Caminho = flip(Caminho);
    
% Define a menor Distancia
    o = find(memo == destino);
    Distancia = memo(o(1),2);


end

