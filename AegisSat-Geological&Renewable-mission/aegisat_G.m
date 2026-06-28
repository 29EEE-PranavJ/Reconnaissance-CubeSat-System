clc;
clear;
close all;

%% TIME

t = 0:0.1:20;

%% DATA

solarPower = 800 + 150*sin(0.2*t);

windSpeed = 12 + 4*cos(0.3*t);

surfaceTemp = 30 + 8*sin(0.15*t);

geothermalIndex = 70 + 20*sin(0.25*t);

renewableScore = ...
0.4*(solarPower/1000) + ...
0.3*(windSpeed/20) + ...
0.3*(geothermalIndex/100);

%% FIGURE

figure('Color','k',...
       'Position',[100 100 1400 800]);

axis([0 100 0 60])

hold on
axis manual

%% VIDEO

v = VideoWriter('AegisSat_GeologicalMission.mp4','MPEG-4');
v.FrameRate = 20;
open(v);

%% MAIN LOOP

for k = 1:length(t)

    clf

    hold on

    axis([0 100 0 60])

    set(gca,...
        'Color','k',...
        'XColor','none',...
        'YColor','none');

    %% SKY

    rectangle('Position',[0 30 100 30],...
              'FaceColor',[0 0 0.15],...
              'EdgeColor','none');

    %% GROUND

    rectangle('Position',[0 0 100 30],...
              'FaceColor',[0.15 0.35 0.15],...
              'EdgeColor','none');

    %% SUN

    sunX = 15;
    sunY = 50;

    scatter(sunX,...
            sunY,...
            1500,...
            'y',...
            'filled');

    %% MOUNTAINS

    fill([10 20 30],...
         [30 48 30],...
         [0.4 0.3 0.2]);

    fill([25 38 50],...
         [30 55 30],...
         [0.45 0.35 0.25]);

    %% RIVER

    xRiver = linspace(0,100,300);

    yRiver = 15 + 2*sin(xRiver/8);

    plot(xRiver,...
         yRiver,...
         'c',...
         'LineWidth',4);

    %% SOLAR FARM

    for s = 55:5:75

        rectangle(...
            'Position',[s 8 3 2],...
            'FaceColor',[1 0.8 0],...
            'EdgeColor','k');

    end

    %% WIND TURBINES

    bladeAngle = t(k)*5;

    turbineX = [82 88 94];

    for n = 1:length(turbineX)

        tx = turbineX(n);

        plot([tx tx],...
             [8 20],...
             'w',...
             'LineWidth',2);

        r = 3;

        for b = 0:120:240

            ang = deg2rad(bladeAngle+b);

            x2 = tx + r*cos(ang);

            y2 = 20 + r*sin(ang);

            plot([tx x2],...
                 [20 y2],...
                 'w',...
                 'LineWidth',2);

        end

    end

    %% VOLCANO

    fill([60 70 80],...
         [30 48 30],...
         [0.4 0.15 0.1]);

    if geothermalIndex(k) > 80

        scatter(70,...
                52,...
                250,...
                'r',...
                'filled');

        text(68,...
             55,...
             'GEOTHERMAL EVENT',...
             'Color','r',...
             'FontWeight','bold');

    end

    %% SATELLITE

    satX = 15 + 70*(k/length(t));

    satY = 55;

    rectangle(...
        'Position',[satX satY 3 1.5],...
        'FaceColor',[0.8 0.8 0.8]);

    %% SCAN BEAM

    targetX = 50 + 15*sin(0.15*k);

    plot([satX+1.5 targetX],...
         [satY 30],...
         'g',...
         'LineWidth',2);

    %% MISSION STAGE

    if t(k) < 5

        stage = 'Terrain Mapping';

    elseif t(k) < 10

        stage = 'Solar Resource Assessment';

    elseif t(k) < 15

        stage = 'Wind Resource Assessment';

    else

        stage = 'Geothermal Monitoring';

    end

    %% TELEMETRY PANEL

    telemetry = sprintf([...
        'MISSION MODE : GEOLOGICAL SURVEY\n\n'...
        'Stage : %s\n\n'...
        'Solar Irradiance : %.1f W/m^2\n'...
        'Wind Speed : %.1f m/s\n'...
        'Surface Temp : %.1f C\n'...
        'Geothermal Index : %.1f\n'...
        'Renewable Score : %.1f %%'],...
        stage,...
        solarPower(k),...
        windSpeed(k),...
        surfaceTemp(k),...
        geothermalIndex(k),...
        renewableScore(k)*100);

    text(75,...
     45,...
     telemetry,...
     'Color','w',...
     'FontSize',11,...
     'FontWeight','bold',...
     'HorizontalAlignment','left');

    %% SCORE BAR

    rectangle(...
        'Position',[5 5 25 2],...
        'EdgeColor','w');

    rectangle(...
        'Position',[5 5 ...
        25*renewableScore(k) 2],...
        'FaceColor','g');

    text(5,...
         8,...
         sprintf('Renewable Potential %.1f %%',...
         renewableScore(k)*100),...
         'Color','g',...
         'FontWeight','bold');

    %% TITLE

    title('AEGISSAT GEOLOGICAL & RENEWABLE ENERGY OBSERVATION MISSION',...
          'Color','w',...
          'FontSize',16,...
          'FontWeight','bold');

    drawnow

    frame = getframe(gcf);

    writeVideo(v,frame);

end

close(v);

disp('AegisSat_GeologicalMission.mp4 Created Successfully');