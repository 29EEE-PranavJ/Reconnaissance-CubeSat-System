clc;
clear;
close all;

%% VIDEO SETTINGS

fps = 20;
duration = 10;

v = VideoWriter('AegisSat_DefenceMission.mp4','MPEG-4');
v.FrameRate = fps;
open(v);

%% THREAT INITIAL POSITION

tx = 1;
ty = 8;

%% MAIN LOOP

figure('Color','k',...
       'Position',[100 100 1200 700]);

for k = 1:fps*duration

    t = k/fps;

    clf

    hold on

    axis([0 10 0 10])

    axis manual

    set(gca,...
        'Color','k',...
        'XColor','w',...
        'YColor','w');

    title('AEGISSAT DEFENCE RECONNAISSANCE SYSTEM',...
          'Color','w',...
          'FontSize',16);

    %% BORDER GRID

    for i=0:2:10

        plot([0 10],[i i],...
             'Color',[0.3 0.3 0.3]);

        plot([i i],[0 10],...
             'Color',[0.3 0.3 0.3]);

    end

    %% SECTOR LABELS

    text(1,9,'A1','Color','w');
    text(3,9,'A2','Color','w');
    text(5,9,'A3','Color','w');
    text(7,9,'A4','Color','w');

    %% SATELLITE

    satx = 5;
    saty = 5;

    plot(satx,saty,...
        'ws',...
        'MarkerSize',12,...
        'MarkerFaceColor','w');

    text(satx+0.2,...
         saty,...
         'AEGISSAT',...
         'Color','w');

    %% RADAR CIRCLE

    theta = linspace(0,2*pi,300);

    plot(satx+3*cos(theta),...
         saty+3*sin(theta),...
         'g');

    %% RADAR SWEEP

    ang = mod(t*2*pi,2*pi);

    plot([satx satx+3*cos(ang)],...
         [saty saty+3*sin(ang)],...
         'g',...
         'LineWidth',2);

    %% FRIENDLY ASSETS

    scatter(2,2,...
            100,...
            'b',...
            'filled');

    scatter(8,3,...
            100,...
            'b',...
            'filled');

    text(1.5,1.5,...
         'Friendly',...
         'Color','c');

    %% PHASES

    if t < 2

    eventText = 'Monitoring Border Region';

    threatIndex = 0;

elseif t < 4

    eventText = 'Radar Sweep Active';

    threatIndex = 10;

elseif t < 6

    tx = tx + 0.08;
    ty = ty - 0.05;

    scatter(tx,ty,...
            120,...
            'r',...
            'filled');

    eventText = 'Intrusion Detected';

    threatIndex = 40;

elseif t < 8

    tx = tx + 0.12;
    ty = ty - 0.08;

    scatter(tx,ty,...
            150,...
            'r',...
            'filled');

    plot([satx tx],...
         [saty ty],...
         'r--',...
         'LineWidth',2);

    eventText = 'Tracking Target';

    threatIndex = 80;

else

    scatter(tx,ty,...
            180,...
            'r',...
            'filled');

    plot([satx tx],...
         [saty ty],...
         'r--',...
         'LineWidth',2);

    eventText = 'Alert Generated';

    threatIndex = 100;

    rectangle('Position',[6.5 7 2.5 1],...
              'FaceColor',[0.8 0 0]);

    text(6.7,7.4,...
         'THREAT CONFIRMED',...
         'Color','w',...
         'FontWeight','bold');

end

    %% THREAT BAR

    rectangle('Position',[0.5 0.5 2 0.4],...
              'EdgeColor','w');

    rectangle('Position',[0.5 0.5 ...
              2*(threatIndex/100) 0.4],...
              'FaceColor','r');

    text(0.5,1.1,...
         sprintf('Threat Index: %d%%',threatIndex),...
         'Color','w');

    %% TIMER

    text(7.5,9.5,...
         sprintf('TIME %.1f s',t),...
         'Color','y',...
         'FontSize',12,...
         'FontWeight','bold');

    %% EVENT LOG

    rectangle('Position',[0.3 8.2 3.5 1],...
              'EdgeColor','w');

    text(0.5,8.7,...
         eventText,...
         'Color','w');

    %% FINAL SCREEN

    if t > 9

        text(5,...
             1,...
             'MISSION COMPLETE',...
             'Color','g',...
             'FontSize',18,...
             'FontWeight','bold',...
             'HorizontalAlignment','center');

    end

    drawnow

    frame = getframe(gcf);

    writeVideo(v,frame);

end

close(v);

disp('Video Exported Successfully');