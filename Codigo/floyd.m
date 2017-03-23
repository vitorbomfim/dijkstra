function [Caminho, Distancia] = floyd(G, origem, destino)

    % Entrada: Grafo G
    %          Origem da busca
    %          Destino da busca
    % Saída  : Um menor Caminho
    %          A Distancia mínima

Distancia = []; % inicializa o vetor distancia
Caminho = destino; % inicializa o vetor caminho

m = [0    10   Inf    10   Inf   Inf   Inf     1
    10     0    10   Inf   Inf   Inf     1   Inf
   Inf    10     0    10   Inf     1   Inf   Inf
    10   Inf    10     0     1   Inf   Inf   Inf
   Inf   Inf   Inf     1     0    12   Inf    12
   Inf   Inf     1   Inf    12     0    12   Inf
   Inf     1   Inf   Inf   Inf    12     0    12
     1   Inf   Inf   Inf    12   Inf    12     0];
 dis = m;
 
 cam = [ 1 2 3 4 5 6 7 8;
         1 2 3 4 5 6 7 8;
         1 2 3 4 5 6 7 8;
         1 2 3 4 5 6 7 8;
         1 2 3 4 5 6 7 8;
         1 2 3 4 5 6 7 8;
         1 2 3 4 5 6 7 8;
         1 2 3 4 5 6 7 8];
 
 for k=1:size(m,1)
     for i=1:size(m,1)
         for j=1:size(m,1)
             if (dis(i,k)+ dis(k,j) < dis(i,j))
                 cam(i,j)=k;
                 dis(i,j) = dis(i,k)+ dis(k,j);
             end
         end
     end
 end

 Distancia = dis(origem,destino);

 while(Caminho(size(Caminho,1)) ~= origem)
     Caminho = [Caminho; cam(destino,origem)];
     if Caminho(size(Caminho,1)) ~= origem
         destino = Caminho(size(Caminho,1));
     end
 end
 
 Caminho = flip(Caminho');
 
end

