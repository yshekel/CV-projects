function [] = plotImageWithDataPoints(figHandle,I,xdata,ydata,markerColor, myTitle)
    % plotImageWithDataPoints(figHandle,Idst,match_p_dst(1,:),match_p_dst(2,:),'b', 'DST FIGURE')
    get(figHandle);
    imshow(I);
    hold on;
    plot(xdata,ydata,[markerColor,'.'],'MarkerSize',20);
    title(myTitle)
    % x = 1:10; y = 1:10; scatter(x,y);
    N = length(xdata);
    a = [1:N]'; b = num2str(a); c = cellstr(b);
    dx = 1; dy = 1; % displacement so the text does not overlay the data points
    text(xdata+dx, ydata+dy, c,'Color','yellow','FontSize',14);
end