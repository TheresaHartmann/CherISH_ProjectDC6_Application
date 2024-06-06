function plot_trajectory(sig, fs, azi, ele, r, str)
% plot_trajectory
%   Usage: plots the trajectory given in AZI, ELE, and R.
%   
%   Input parameters: 
%		fs:  sampling frequency
%		azi: the azimuth angles of the actual trajectory (degrees)
%		ele: the elevation angles of the actual trajectory (degrees)
%       r: vector with the radius/distance (in meters) of the actual trajectory
%		str: label of the figure
%

    %% plot the trajectories 
    t = (1:length(azi))/fs;
    figure();
    subplot(3,1,1);
    plot(t,azi); % plot azial trajectory
    ylabel('azi (deg)');
    title(['Trajectory: ', str]);
    subplot(3,1,2);
    plot(t,ele); % plot elevational trajectory
    ylabel('Elevation (deg)');
    xlabel('t (s)');
    subplot(3,1,3);
    plot(t,r); % plot radius
    ylabel('Radius (m)');
    xlabel('t (s)');

    %% plot the signal
    t_sig = (1:length(sig))/fs;
    figure();
    sgtitle(['Signal: ', str])
    subplot(1,2,1);
    plot(t_sig,sig(:,1)); % plot left
    ylabel("Amplitude");
    xlabel('t (s)');
    title("left side");
    subplot(1,2,2);
    plot(t_sig,sig(:,2)); % plot rigth
    ylabel("Amplitude");
    xlabel('t (s)');
    title("rigth side");
end