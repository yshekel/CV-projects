function [mp_src_meets_model,mp_dst_meets_model] = meet_model_points(H, mp_src, mp_dst, max_err)
%% returns the 
N = length(mp_src(1,:));
mp_src_meets_model = [];   mp_dst_meets_model = []; 
for ii = 1:N
    col = mp_src(1,ii);     row = mp_src(2,ii);
    v = H * [col; row; 1];
    newCol = round(v(1)/v(3));
    newRow = round(v(2)/v(3));
    distance = sqrt((newCol - mp_dst(1,ii))^2 + (newRow - mp_dst(2,ii))^2);
    if distance <= max_err
        mp_dst_meets_model = [mp_dst_meets_model, [mp_dst(1,ii);mp_dst(2,ii)]];
        mp_src_meets_model = [mp_src_meets_model, [mp_src(1,ii);mp_src(2,ii)]];
    end
end
end
