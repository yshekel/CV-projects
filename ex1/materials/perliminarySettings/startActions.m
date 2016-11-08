%%
close all;
clear all;
clc;

%% load stuff
path = 'materials\';
src_figure = 'src.jpg';
dst_figure = 'dst.jpg';
load_matrices = 'matches_perfect.mat';

Idst = imread([path dst_figure]);
Isrc = imread([path src_figure]);
load([path load_matrices]);
%% show stuff
figure; imshow(Idst);
hold on;
plot(match_p_dst(1,:),match_p_dst(2,:),'b.','MarkerSize',20);
title('DST FIGURE')
%%
f = figure; 
plotImageWithDataPoints(f,Idst,match_p_dst(1,:),match_p_dst(2,:),'b', 'DST FIGURE')
%%
f2 = figure; 
plotImageWithDataPoints(f2,Isrc,match_p_src(1,:),match_p_src(2,:),'b', 'SRC FIGURE')

figure;
subplot(1,2,1);
plotImageWithDataPoints(f2,Isrc,match_p_src(1,:),match_p_src(2,:),'b', 'SRC FIGURE')
% subplot(1,2,1);
% imshow(Isrc);
% hold on;
% plot(match_p_src(1,:),match_p_src(2,:),'b.','MarkerSize',20);
% title('SRC FIGURE');
subplot(1,2,2);
plotImageWithDataPoints(f2,Idst,match_p_dst(1,:),match_p_dst(2,:),'b', 'DST FIGURE')
% 
% imshow(Idst);
% hold on;
% plot(match_p_dst(1,:),match_p_dst(2,:),'b.','MarkerSize',20);
% title('DST FIGURE')


right_points_dst = match_p_dst;
right_points_src = match_p_src;
%% load some more stuff
matches_path = 'matches.mat';
load([path matches_path])

wrong_points_dst = [];
wrong_points_src = [];

for ii = 1: length(match_p_dst)
    flag = 0;
    for jj = 1:length(right_points_dst)
        if match_p_dst(1,ii) == right_points_dst(1,jj) & ...
                match_p_dst(2,ii) == right_points_dst(2,jj)
            flag = 1;
        end
    end
     if ~flag
         wrong_points_dst = [wrong_points_dst , match_p_dst(:,ii)];
    end
end
for ii = 1: length(match_p_src)
    flag = 0;
    for jj = 1:length(right_points_src)
        if match_p_src(1,ii) == right_points_src(1,jj) & ...
                match_p_src(2,ii) == right_points_src(2,jj)
            flag = 1;
        end
    end
     if ~flag
         wrong_points_src = [wrong_points_src , match_p_src(:,ii)];
    end
end
%% show perfect match and imperfect matching points for dst image
close all;
f = figure; imshow(Idst);
plotImageWithDataPoints(f,Idst,right_points_dst(1,:),right_points_dst(2,:),'b', 'DST FIGURE')
hold on;
N = length(wrong_points_dst(1,:));
a = 20+[1:N]'; b = num2str(a); c = cellstr(b);
dx = 1; dy = 1; % displacement so the text does not overlay the data points
xdata = wrong_points_dst(1,:);
ydata = wrong_points_dst(2,:);
plot(xdata,ydata,'r.','MarkerSize',20)
legend('perfect matching points','imprefect match points')
text(xdata+dx, ydata+dy, c,'Color','red','FontSize',14);
%% show perfect match and imperfect matching points for src image

f2 = figure; imshow(Isrc);
plotImageWithDataPoints(f2,Isrc,right_points_src(1,:),right_points_src(2,:),'b', 'SRC FIGURE')
hold on;
N = length(wrong_points_src(1,:));
a = 20+[1:N]'; b = num2str(a); c = cellstr(b);
dx = 1; dy = 1; % displacement so the text does not overlay the data points
xdata = wrong_points_src(1,:);
ydata = wrong_points_src(2,:);
plot(xdata,ydata,'r.','MarkerSize',20)
legend('perfect matching points','imprefect match points')
text(xdata+dx, ydata+dy, c,'Color','red','FontSize',14);
%%
close all;
f = figure;
subplot(1,2,2);
plotImageWithDataPoints(f,Idst,right_points_dst(1,:),right_points_dst(2,:),'b', 'DST FIGURE')
hold on;
N = length(wrong_points_dst(1,:));
a = 20+[1:N]'; b = num2str(a); c = cellstr(b);
dx = 1; dy = 1; % displacement so the text does not overlay the data points
xdata = wrong_points_dst(1,:);
ydata = wrong_points_dst(2,:);
plot(xdata,ydata,'r.','MarkerSize',20)
legend('perfect matching points','imprefect match points')
text(xdata+dx, ydata+dy, c,'Color','red','FontSize',14);


subplot(1,2,1);

imshow(Isrc);
plotImageWithDataPoints(f,Isrc,right_points_src(1,:),right_points_src(2,:),'b', 'SRC FIGURE')
hold on;
N = length(wrong_points_src(1,:));
a = 20+[1:N]'; b = num2str(a); c = cellstr(b);
dx = 1; dy = 1; % displacement so the text does not overlay the data points
xdata = wrong_points_src(1,:);
ydata = wrong_points_src(2,:);
plot(xdata,ydata,'r.','MarkerSize',20)
legend('perfect matching points','imprefect match points')
text(xdata+dx, ydata+dy, c,'Color','red','FontSize',14);


