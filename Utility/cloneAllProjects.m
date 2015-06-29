%% Clone All Projects
% This script clones all the desired projects

%% Start Clean

% Construct a questdlg with two options
choice = questdlg('Are you sure you want to.... (>>clear; close all; home) ?', ...
	'Start Clean', ...
	'Yes','No','Yes');

% Handle the response
switch choice
    case 'Yes'
       clear; close all; home
    case 'No'
       disp('Nothing in the base workspace was cleared and figures were left open')
end
disp('Cloning desired projects...')

%% Get Some Info

startingDirectory = pwd;

%% Specify the Desired Projects

% Format: Project Group Namespace, Project Name, Remote SSH address, Remote HTTP address
projectList = {...
    'Aircraft', 'ElectricalSystem', 'git@insidelabs-git.mathworks.com:Aircraft/ElectricalSystem.git';...
    [], 'WaterSupplySystem', 'git@insidelabs-git.mathworks.com:dmeissne/watersupplysystem.git';...
    [], 'HeatExchanger', 'git@insidelabs-git.mathworks.com:dmeissne/heatexchanger.git';...
    [], 'RoboticsSystemsToolbox', 'git@insidelabs-git.mathworks.com:dmeissne/roboticssystemtoolbox.git';...
    [], 'SolarAnalysis', 'git@insidelabs-git.mathworks.com:dmeissne/solaranalysis.git';...
    [], 'TheBasics', 'git@insidelabs-git.mathworks.com:dmeissne/thebasics.git';...
    [], 'Quadcopter', 'git@insidelabs-git.mathworks.com:dmeissne/quadcopter.git'};

%% Clone the Projects

% Create the new project directories
for ii = 1:size(projectList, 1)
    if ~isempty(projectList{ii, 1})
        newDirectory = fullfile('\', 'Users', 'davidmeissner', 'Demos', projectList{ii, 1}, projectList{1, 2});
    else
       newDirectory = fullfile('\', 'Users', 'davidmeissner', 'Demos', projectList{ii, 2});
    end
    % Clone
    if ~exist(newDirectory, 'dir')
        mkdir(newDirectory)
        cd(newDirectory)
        evalin('base', ['!git clone ', projectList{ii, 3}, ' ', newDirectory]);
    end
end

cd(startingDirectory)