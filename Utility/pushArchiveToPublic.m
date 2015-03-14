%% Archive the Current HEAD can copy it to you public folder
%
% In order to make demo content developed or maintained using Git available
% to those who do not use Git, it's beneficial to place a .zip archive of
% the material in your public folder.
%
% By David Meissner
% Copyright 2015, The MathWorks, Inc.
%% Assumptions
%
% The version of the material that you want to archive is the current HEAD
%
%% Set Defaults
thisProject = slproject.getCurrentProject;
projectName = thisProject.Name;
myPublicFolder = '\\mathworks\AH\Public\David_Meissner\sharedDemos\CoreDemoTemplateGit';

%% Prompt for User Input
prompt = {['File name for the .zip file: default file name is ', projectName, '.zip'], ['Path to Public Folder: default path is', myPublicFolder]};
dlg_title = 'Archive';
num_lines = 1;
def = {'20','hsv'};
answer = inputdlg(prompt,dlg_title,num_lines,def);
% Use the defaults unless something else was entered
if ~isempty(answer{1})
    fileName = answer{1};
else
    fileName = projectName;
end
if ~isempty(answer{2})
    folderName = answer{2};
else
    folderName = myPublicFolder;
end

%% Create the Archive
eval(['!git archive -o ', fileName, '.zip HEAD'])

%% Copy/Paste the Archive to your public folder
eval(['copy ', fileName, '.zip ', folderName, ' /Y'])