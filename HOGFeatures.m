function Feature = HOGFeatures(I)
    img = I;
    hx = [-1 0 1];
    fx = imfilter(img, hx);
    fy = imfilter(img, hx');
    Gabs = sqrt(double(fx.^2 + fy.^2));
    Gtheta = round(atand(double(fy)./double(fx)));

    cell_row = floor(size(img,1)/8);
    cell_col = floor(size(img,2)/8);
    V = zeros(cell_row, 9, cell_col);

    for row = 1:cell_row
        for col = 1:cell_col
            V(row, :, col) = calcV(Gtheta((row-1)*8+1:(row-1)*8+8, (col-1)*8+1:(col-1)*8+8), Gabs((row-1)*8+1:(row-1)*8+8, (col-1)*8+1:(col-1)*8+8));
        end
    end

    Ft = [];
    for i = 1: cell_row-1
        for j = 1: cell_col-1
            Ft = [Ft calcK(V(i:i+1, :, j:j+1))];
            s = size(Ft);
        end
    end
    Ft(isnan(Ft))=0;
    %imshow(['G:\PRJ\PROJECT\CROP_BLACK_GRAY_BMP\TUIXACH\' num2str(count) '.bmp']);
    Feature = Ft;
end

