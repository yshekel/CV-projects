%% Homography computation:
%% load stuff :
path = 'C:\Users\ajevn\OneDrive\cvapps\ex1\materials\';
load_matrices = 'matches_perfect.mat';
load([path load_matrices]);
%% compute the transformation matrix :
H = compute_homography_naive(match_p_src,match_p_dst);
disp(H)
%% load source image :
src_figure = 'src.jpg';
Isrc = imread([path src_figure]);
figure; imshow(Isrc);title('SRC image')
%% construct dest image :
[rowNum, colNum, ~] = size(Isrc);
Idst_reconstructed = uint8(zeros(size(Isrc)));

for col = 1:colNum
    for row = 1:rowNum
        v = H * [col; row; 1];
        newCol = round(v(1)/v(3));
        newRow = round(v(2)/v(3)); 
        if (newRow <= rowNum) & (newCol <= colNum) & (newRow >=1) & (newCol >=1)
            for d = 1:3
                Idst_reconstructed(newRow, newCol,d) = Isrc(row,col,d);                
            end
        end
    end
end


%% show dest image :
path = 'C:\Users\ajevn\OneDrive\cvapps\ex1\materials\';
dst_figure = 'dst.jpg';
Idst = imread([path dst_figure]);

figure;
subplot(2,2,1);
imshow(Isrc,[]); title('SRC image')
subplot(2,2,2);
imshow(Idst_reconstructed,[]); title('DST reconstructed image')
subplot(2,2,[3 4]);
imshow(Idst,[]); title('DST image');
figure;
imshow(Idst_reconstructed,[]); title('DST reconstructed image')
%% loading matches.mat 
%% load stuff :
path = 'C:\Users\ajevn\OneDrive\cvapps\ex1\materials\';
load_matrices = 'matches.mat';
load([path load_matrices]);
%% compute the transformation matrix :
H = compute_homography_naive(match_p_src,match_p_dst);
disp(H)
%% load source image :
src_figure = 'src.jpg';
Isrc = imread([path src_figure]);
figure; imshow(Isrc);title('SRC image')
%% construct dest image :
[rowNum, colNum, ~] = size(Isrc);
Idst_reconstructed = uint8(zeros(size(Isrc)));

for col = 1:colNum
    for row = 1:rowNum
        v = H * [col; row; 1];
        newCol = round(v(1)/v(3));
        newRow = round(v(2)/v(3)); 
        if (newRow <= rowNum) & (newCol <= colNum) & (newRow >=1) & (newCol >=1)
            for d = 1:3
                Idst_reconstructed(newRow, newCol,d) = Isrc(row,col,d);                
            end
        end
    end
end


%% show dest image :
path = 'C:\Users\ajevn\OneDrive\cvapps\ex1\materials\';
dst_figure = 'dst.jpg';
Idst = imread([path dst_figure]);

figure;
subplot(2,2,1);
imshow(Isrc,[]); title('SRC image')
subplot(2,2,2);
imshow(Idst_reconstructed,[]); title('DST reconstructed image')
subplot(2,2,[3 4]);
imshow(Idst,[]); title('DST image');
figure;
imshow(Idst_reconstructed,[]); title('DST reconstructed image')