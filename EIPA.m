%E(m,n) = (E[(m+1),n] + E[(m-1),n] + E[m,(n+1)] + E[m,(n-1)])/4 + a
nx = 50;
ny = 50
G = sparse(nx*ny,nx*ny);
%G = sparse(eye(nx*ny));


for i = 1:nx
    for j = 1:ny
        n = j + (i-1)*ny;
        
        if i ==1 || j == 1
            G(n,:) = 0;
            G(n,n) = 1;
        elseif i == nx || j == ny
            G(n,:) = 0;
            G(n,n) = 1;
        else
            nxm = j + (i-2)*ny;
            nxp = j + i*ny;
            nyp = j + 1 + (i-1)*ny;
            nym = j - 1 + (i-1)*ny;
            
            if i > 10 && i < 20 & j > 10 & j <20
                G(n,n) = -2;
            else
            G(n,n) = -4;
            end
            
            G(n,nxm) = 1;
            G(n,nxp) = 1;
            G(n,nym) = 1;
            G(n,nyp) = 1;
        end
    end
end



figure
spy(G)

[E,D] = eigs(G,9,'SM');

for k = 1:9
    for i = 1:nx
    for j = 1:ny
        n = j + (i-1)*ny;
        Emap(i,j) = E(n,k);
    end
    end
    surf(Emap)
end
    
    
