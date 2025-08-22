%% Task 10(Perform the whole analysis for base case only with 7,14 and 21 frequency points)
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
% frequency points 7
figure
impedance(pb1,linspace(2.2e9,2.5e9,7))
title("impedance Plot with 7 Frequency Points")
% frequency points 14
figure
impedance(pb1,linspace(2.2e9,2.5e9,14))
title("impedance Plot with 14 Frequency Points")
% frequency points 21
figure
impedance(pb1,linspace(2.2e9,2.5e9,21))
title("impedance Plot with 21 Frequency Points")
%% Radiation Pattern
figure
pattern(pb1,2.37e9)
