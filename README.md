The main script is CherISH_ProjectDC6_Hartmann.m 
It contains the following task parts:

1.	Create a Gaussian white noise burst with a duration of 1 sec and smooth on/offset ramps of 10 msec.
2.	Create 3 spatial trajectories for this noise burst by using the HRTF set SCUT_KEMAR_radius_all.sofa 
  2.1.	Horizontal clockwise rotation around the listener at a distance of 1 m (varying azimuth, 0° elevation, 1 m radius)
  2.2.	Approach from left (90° azimuth, 0° elevation, radius decreasing from 1 m to 0.2 m)
  2.3.	Approach from front (0° azimuth, 0° elevation, radius decreasing from 1 m to 0.2 m)
3.	Plot the spectrograms of the generated sounds. Limit the plotted dynamic range to 60 dB. 

The function plot_trajectory.m is used to plot the trajectories and the spatialized signals. It is used in CherISH_ProjectDC6_Hartmann.m.

The HRTF set (SCUT_KEMAR_radius_all.sofa) is from https://sofacoustics.org/data/database/scut/
The SOFAtoolbox is from https://github.com/sofacoustics/SOFAtoolbox/blob/master/SOFAtoolbox/SOFAspat.m
The ltfat Toolbox is from https://github.com/ltfat/ltfat/releases
