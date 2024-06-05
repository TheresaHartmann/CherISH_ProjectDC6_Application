function plot_trajectory(fs, azi, ele, r, str)
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

end