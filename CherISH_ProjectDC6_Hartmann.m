%% Programming exercise - CherISH PhD candidate application Project DC6
% #Author: Theresa Hartmann

%% Initialization
clear; clc;
addpath('SOFAtoolbox');
addpath('ltfat');
SOFAstart;
ltfatstart;


%% 1. Create a Gaussian white noise burst with a duration of 1 sec and smooth on/offset ramps of 10 msec

% Load the HRTFs
hrtf = SOFAload("SCUT_KEMAR_radius_all.sofa");

% signal 
dt= 1 /hrtf.Data.SamplingRate;
len = 1; % time in sec
t = 0:dt:len-dt;
noise = randn(len*hrtf.Data.SamplingRate,1);

% smooth on/offset ramps
window = zeros(length(t),1);
% smooth on/offset ramps
ramp = round(0.01*hrtf.Data.SamplingRate); % ramp in and out for 10 ms
win=hanning(ramp*2);  
% windowed signal
noise(1:ramp)=noise(1:ramp).*win(1:ramp);
noise(end-ramp+1:end)=noise(end-ramp+1:end).*win(ramp+1:end); 
figure();
plot(t, noise), ylabel("Amplitude"), xlabel("Time [s]"), title("Gaussian white noise burst");


%% 2. Create 3 spatial trajectories for this noise burst by using the HRTF set SCUT_KEMAR_radius_all.sofa 

%% 2.1.	Horizontal clockwise rotation around the listener at a distance of 1 m (varying azimuth, 0° elevation, 1 m radius)

% Define the trajectory
azimuth1 = [180 0 -180];	% azimuth angles in degrees 
elevation1 = [0 0 0 0];     % elevation angles in degrees
radius1 = 1;                % distance to the head

% Spatialize
[spat_signal1, spat_azimuth1, spat_elevation1, spat_radius1, idx1] = SOFAspat(noise, hrtf, azimuth1, elevation1, radius1);

% Plot the trajectories
plot_trajectory(hrtf.Data.SamplingRate, spat_azimuth1, spat_elevation1, spat_radius1, '2.1.	Horizontal clockwise rotation')

% % Play the sound - use headphones!
soundsc(spat_signal1, hrtf.Data.SamplingRate);


%% 2.2.	Approach from left (90° azimuth, 0° elevation, radius decreasing from 1 m to 0.2 m)

% Define the trajectory
azimuth2 = [90 90 90];	% azimuth angles in degrees 
elevation2 = [0 0 0 0]; % elevation angles in degrees
radius2 = [1 0.2];      % distance to the head

% Spatialize
[spat_signal2, spat_azimuth2, spat_elevation2, spat_radius2, idx2] = SOFAspat(noise, hrtf, azimuth2, elevation2, radius2);

% Plot the trajectories
plot_trajectory(hrtf.Data.SamplingRate, spat_azimuth2, spat_elevation2, spat_radius2, '2.2.	Approach from left')

% Play the sound - use headphones!
soundsc(spat_signal2, hrtf.Data.SamplingRate);



%% 2.3.	Approach from front (0° azimuth, 0° elevation, radius decreasing from 1 m to 0.2 m)

% Define the trajectory
azimuth3 = [0 0 0];	    % azimuth angles in degrees 
elevation3 = [0 0 0 0]; % elevation angles in degrees
radius3 = [1 0.2];      % distance to the head

% Spatialize
[spat_signal3, spat_azimuth3, spat_elevation3, spat_radius3, idx3] = SOFAspat(noise, hrtf, azimuth3, elevation3, radius3);

% Plot the trajectories
plot_trajectory(hrtf.Data.SamplingRate, spat_azimuth3, spat_elevation3, spat_radius3, '2.3.	Approach from front')

% Play the sound - use headphones!
soundsc(spat_signal3, hrtf.Data.SamplingRate);



%% 3. Plot the spectrograms of the generated sounds. Limit the plotted dynamic range to 60 dB

% plots spectrogram with a limit of the dynamic range of the plot of the generated sounds in excersice 2.1.
figure();
sgtitle("2.1. Horizontal clockwise rotation")
subplot(1,2,1);
sgram(spat_signal1(:,1),hrtf.Data.SamplingRate,'dynrange',60) % left side
title("left side")
subplot(1,2,2);
sgram(spat_signal1(:,2),hrtf.Data.SamplingRate,'dynrange',60) % right side
title("right side")

% plot spectrograms of the generated sounds in excersice 2.2.
figure();
sgtitle("2.2. Approach from left")
subplot(1,2,1);
sgram(spat_signal2(:,1),hrtf.Data.SamplingRate,'dynrange',60) % left side
title("left side")
subplot(1,2,2);
sgram(spat_signal2(:,2),hrtf.Data.SamplingRate,'dynrange',60) % right side
title("right side")

% plot spectrograms of the generated sounds in excersice 2.3.
figure();
sgtitle("2.3. Approach from front")
subplot(1,2,1);
sgram(spat_signal3(:,1),hrtf.Data.SamplingRate,'dynrange',60) % left side
title("left side")
subplot(1,2,2);
sgram(spat_signal3(:,2),hrtf.Data.SamplingRate,'dynrange',60) % right side
title("right side")

