function H = compute_homography(mp_src, mp_dst, inliers_percent, max_err)
% computes the transformation coeffs using RANSAC to overcome ouliers

%% transforming to class notations :
w = inliers_percent;
% t = max_err;
p = 0.99;   % parameter determining the probability of the algorithm to succeed
d = 0.5;    % the minimal probability of points which meets with the model
n = 4;      % number of points sufficient to compute the model
K = ceil(log(1-p)/log(1 - w^n));    % number of RANSAC iterations
N = length(mp_src(1,:));            % data length
%% variables storing the best model fit
mp_src_meets_model = [];    mp_dst_meets_model = [];
d_opt = 0; % maximal consensus so far
%% Run RANSAC :
for ii = 1:K
    % sample n=4 random observations [1:N]
    sample_indices = datasample(1:N, n,'Replace',false); 
    % compute the homography using the sampled points
    H = compute_homography_naive(mp_src(:,sample_indices),...
        mp_dst(:,sample_indices));
    % compute the fit_percent which is equal to the consunsus measure :
    [fit_percent, ~] = test_homography(H, mp_src, mp_dst, max_err);
%     disp(['fit percent @ iteration = ',num2str(ii),' is :', num2str(fit_percent)])
    if fit_percent > max(d,d_opt)  % if the consensus is larger than the consunsus threshold & optimal consensus, consider keeping it
        [mp_src_meets_model,mp_dst_meets_model] = meet_model_points(H, mp_src, mp_dst, max_err);
        d_opt = fit_percent; % update the optimal consensus
    end
end
if d_opt > 0
    H = compute_homography_naive(mp_src_meets_model, mp_dst_meets_model); % compute the homography using the optimal consensus
else
    H = [];
end
% disp(H);
end
