clc;
clear;
close all;

%% TIME

t = 0:0.1:20;

%% TELEMETRY

altitude = 500 + 5*sin(0.1*t);
battery = 100 - 0.3*t;
temperature = 25 + 10*sin(0.2*t);

roll = 10*sin(0.5*t);
pitch = 8*cos(0.4*t);
yaw = mod(5*t,360);

%% FIGURE

figure('Color','k',...
       'Position',[100 100 1400 800]);

hold on

%% STAR FIELD

numStars = 300;

starX = 12*(rand(numStars,1)-0.5);
starY = 12*(rand(numStars,1)-0.5);
starZ = 12*(rand(numStars,1)-0.5);

scatter3(starX,...
         starY,...
         starZ,...
         3,...
         'w',...
         'filled');

%% EARTH

earthImage = imread('earth.jpeg');

[X,Y,Z] = sphere(100);

X = -X;      % flip longitude
earthImage = flipud(earthImage);  % flip latitude

earthHandle = surface(...
    X,Y,Z,...
    'FaceColor','texturemap',...
    'EdgeColor','none',...
    'CData',earthImage);

%% SUN

[sx,sy,sz] = sphere(40);

sunHandle = surf(...
    8 + 0.6*sx,...
    0 + 0.6*sy,...
    0 + 0.6*sz,...
    'FaceColor',[1 0.9 0],...
    'EdgeColor','none');

%% SUNLIGHT INDICATOR

sunlightText = text(3,...
                    -2.5,...
                    1.5,...
                    '',...
                    'Color','y',...
                    'FontSize',12,...
                    'FontWeight','bold');

%% ORBIT PATH

thetaOrbit = linspace(0,2*pi,1000);

orbitX = 2.4*cos(thetaOrbit);
orbitY = 2.4*sin(thetaOrbit);
orbitZ = zeros(size(thetaOrbit));

plot3(orbitX,...
      orbitY,...
      orbitZ,...
      'w--',...
      'LineWidth',1);



%% CUBESAT BODY

cubeSize = 0.20;

baseVertices = cubeSize * [
    -1 -1 -1
     1 -1 -1
     1  1 -1
    -1  1 -1
    -1 -1  1
     1 -1  1
     1  1  1
    -1  1  1];

faces = [
    1 2 3 4
    5 6 7 8
    1 2 6 5
    2 3 7 6
    3 4 8 7
    4 1 5 8];

satelliteBody = patch(...
    'Vertices',baseVertices,...
    'Faces',faces,...
    'FaceColor',[0.8 0.8 0.8],...
    'EdgeColor','k',...
    'LineWidth',1.5);

%% SOLAR PANELS

panelLength = 0.35;
panelWidth = 0.12;

leftPanelVertices = [
   -cubeSize-panelLength  -panelWidth  0
   -cubeSize             -panelWidth  0
   -cubeSize              panelWidth  0
   -cubeSize-panelLength  panelWidth  0];

rightPanelVertices = [
    cubeSize             -panelWidth  0
    cubeSize+panelLength -panelWidth  0
    cubeSize+panelLength  panelWidth  0
    cubeSize              panelWidth  0];

panelFaces = [1 2 3 4];

leftPanel = patch(...
    'Vertices',leftPanelVertices,...
    'Faces',panelFaces,...
    'FaceColor',[0 0.3 1],...
    'EdgeColor','w');

rightPanel = patch(...
    'Vertices',rightPanelVertices,...
    'Faces',panelFaces,...
    'FaceColor',[0 0.3 1],...
    'EdgeColor','w');

%% TELEMETRY PANEL

telemetryText = text(3,...
                     2.5,...
                     1.5,...
                     '',...
                     'Color','w',...
                     'FontSize',12,...
                     'FontWeight','bold');

%% VIEW

axis equal
axis off

view(35,25)
camzoom(2.5)

xlim([-6 6])
ylim([-6 6])
zlim([-6 6])

%% EARTH SHADOW CYLINDER

[Xc,Yc,Zc] = cylinder(1,50);

Xc = -2.5*Xc;
Yc = 1.5*(Yc-0.5);
Zc = 1.5*Zc-0.75;

shadowHandle = surf(...
    Xc,...
    Yc,...
    Zc,...
    'FaceAlpha',0.15,...
    'FaceColor',[0.2 0.2 0.2],...
    'EdgeColor','none');

%% VIDEO

videoObj = VideoWriter('CubeSatMission.mp4','MPEG-4');
videoObj.FrameRate = 20;

open(videoObj);

%% ANIMATION LOOP

for k = 1:length(t)

    theta = 2*pi*k/length(t);

    x = 1.8*cos(theta);
    y = 1.8*sin(theta);
    z = 0.3*sin(theta);

    %% MOVE SATELLITE

    newVertices = baseVertices + [x y z];

    set(satelliteBody,...
        'Vertices',newVertices);

    newLeftPanel = leftPanelVertices + [x y z];
        newRightPanel = rightPanelVertices + [x y z];

    set(leftPanel,...
        'Vertices',newLeftPanel);

    set(rightPanel,...
        'Vertices',newRightPanel);

  

    %% EARTH ROTATION

if mod(k,5)==0

    rotate(earthHandle,...
           [0 0 1],...
           0.5,...
           [0 0 0]);

end
    %% SUNLIGHT / ECLIPSE MODE

sunVector = [8 0 0];

satVector = [x y z];

if dot(sunVector,satVector) > 0

    powerMode = 'SOLAR CHARGING';

else

    powerMode = 'ECLIPSE MODE';

end
%% MISSION STAGES

    if t(k) < 6

    stage = 'Orbit Insertion';

elseif t(k) < 10

    stage = 'Geological Survey';

elseif t(k) < 15

    stage = 'Aerospace Monitoring';

elseif strcmp(powerMode,'ECLIPSE MODE')

    stage = 'Eclipse Transit';

else

    stage = 'Communication';

end

%% TELEMETRY

    info = sprintf([...
'MISSION STAGE : %s\n\n' ...
'POWER MODE   : %s\n\n' ...
'Altitude     : %.1f km\n' ...
'Battery      : %.1f %%\n' ...
'Temperature  : %.1f C\n' ...
'Roll         : %.1f deg\n' ...
'Pitch        : %.1f deg\n' ...
'Yaw          : %.1f deg'],...
stage,...
powerMode,...
altitude(k),...
battery(k),...
temperature(k),...
roll(k),...
pitch(k),...
yaw(k));
set(telemetryText,...
    'String',info);
set(sunlightText,...
    'String',['POWER MODE : ' powerMode]);
drawnow

frame = getframe(gcf);

writeVideo(videoObj,frame);

end

close(videoObj);

disp('MissionExospace.mp4 Created Successfully!');