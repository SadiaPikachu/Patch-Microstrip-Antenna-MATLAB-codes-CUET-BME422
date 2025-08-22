%% Create the Patch Antenna
p1 = patchMicrostrip;
%%  Physical Dimensions of the Patch 
p1.Length = 40e-3;
p1.Width = 30e-3;
p1.Height = 1.57e-3;
%% Ground Plane Size
p1.GroundPlaneLength = 80e-3;
p1.GroundPlaneWidth = 60e-3;
%%  Feed Point position
p1.FeedOffset = [5.5e-3 0];
%% Substrate Material
p1.Substrate = dielectric('Name', 'material1', 'EpsilonR', 2.33);
pb1 = pcbStack(p1);
%% Feed Details
pb1.FeedDiameter = sqrt(2)*1e-3;
pb1.FeedViaModel = "square"
figure
show(pb1)
title("Patch Antenna with Thin Substrate")
%% meshing
figure
mesh(pb1,MaxEdgeLength=0.01,MinEdgeLength=0.003)
%% Input Impedance 
figure
impedance(pb1,linspace(2.2e9,2.5e9,5))
%% Radiation Pattern
figure
pattern(pb1,2.37e9)
