% calculate K and normalize feature vector for each 16x16 blocks.
function Vnor = calcK(V)
    Vnor = [V(1,:,1) V(1,:,2) V(2,:,2)];
    k = 0;
    for i = 1: length(Vnor)
        k = k + Vnor(i)^2;
    end
    k = sqrt(k);
    Vnor = Vnor./k;
end