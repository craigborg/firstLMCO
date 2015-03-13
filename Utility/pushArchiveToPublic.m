%% Push Archive To Public Folder
%
% In order to make demo content developed or maintained using Git available
% to those who do not use Git, it's beneficial to place a .zip archive of
% the material in your public folder.
%
% By David Meissner
% Copyright 2015, The MathWorks, Inc.
%% Assumptions
%
% The version of the material that you want to archive is the latest
% commit on the master branch
%
%% Checkout the master
% !git checkout master

%% Create the Archive
timeStamp = char(datetime('now','Format','yyyy-MM-dd_HH:mm:ss'));
thisProject = slproject.getCurrentProject;
projectName = thisProject.Name;
fileName = [projectName,timeStamp]
% >git archive -o fileName.zip HEAD

%% Copy/Paste the Archive to your public

myPublic = '\\mathworks\AH\Public\David_Meissner\sharedDemos\CoreDemoTemplateGit'
% >copy fileName myPublic