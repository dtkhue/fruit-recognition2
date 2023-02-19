% calculate V for each cell.
function V = calcV(Gtheta, Gabs)
    V = zeros(1, 9);
    for i = 1:8
        for j = 1:8
            if (~isnan(Gtheta(i,j)))
                x = floor(Gtheta(i,j)/20) +1;
                V(x) = V(x) + abs(x*20 - Gabs(i,j))/20;
                if (x < 9)
                    V(x+1) = V(x+1) + abs(Gabs(i,j) - (x-1)*20)/20;
                else
                    V(1) = V(1) + abs(Gabs(i,j) - (x-1)*20)/20;
                end
            end
        end
    end
end