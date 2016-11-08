function [fit_percent, dist_mse] = test_homography(H, mp_src, mp_dst, max_err)
N = length(mp_src(1,:));
fit_percent = 0;
dist_mse = 0;
for ii = 1:N
    col = mp_src(1,ii);     row = mp_src(2,ii);
    v = H * [col; row; 1];
    newCol = round(v(1)/v(3));
    newRow = round(v(2)/v(3));
    distance = sqrt((newCol - mp_dst(1,ii))^2 + (newRow - mp_dst(2,ii))^2);
    if distance < max_err
        fit_percent = fit_percent + 1;
        dist_mse = dist_mse + (newCol - mp_dst(1,ii))^2 + (newRow - mp_dst(2,ii))^2;
    end
end
dist_mse = dist_mse / fit_percent;
fit_percent = fit_percent/N;

end