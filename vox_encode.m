function [B] = vox_encode(A)
    % raster style run length encoding
    dim = size(A);
    key = -1;
    value = 0;
    B = zeros(1, 2);
    index = 1;

    for i = 1:dim(1)
        for j = 1:dim(2)
            for k = 1:dim(3)
                if A(i, j, k) == key
                    value = value + 1;
                else
                    % save next sequence
                    B(index, :) = [key, value];
                    index = index + 1;

                    % new count
                    key = A(i, j, k);
                    value = 1;

                end
            end
        end
    end
    % add last entry
    B(index, :) = [key, value];
    B(1, :) = [];
end