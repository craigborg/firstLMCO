function projectStartup()
%%
thisProject = slproject.getCurrentProject;
rootFolder  = thisProject.RootFolder;

updateProjectPath;

workFolder = fullfile(rootFolder, 'Work');

if ~exist(workFolder, 'dir')
    mkdir(workFolder);
end

%% Generic Tasks
% Open what I need to navigate the demo (LTC vs CDA vs SPC may have
% different techniques here)
openHTML(); % publish the html for navigation and open it
getRootFolder; % make the rootFolder available in the workspace, if needed
% convertFromOldVersion % convert all old simulink models to the current Sversion
%
%% Custom Tasks for this demo
% % Specify that the work folder be the cache folder for files related to
% % model updates and code generation
% myCacheFolder = workFolder;
% Simulink.fileGenControl('set', 'CacheFolder', myCacheFolder, ...
% 'CodeGenFolder', myCacheFolder);
% 
% % You might want to turn off some warnings
% warning('off','Simulink:Logging:LoggingOutportWithSlowTs')  % Turn off the warning for slower logging of output port
% 
% % If your demo has a simcape component to build, build them
% if(exist('Libraries', 'dir')==7)
%     cd(fullfile(rootFolder,'Component','Libraries'))
%     % Build the component library if it doesn't exist
%     if((exist('+variableOrificeComponents','dir')==7) && ~exist('variableOrificeComponents_lib', 'file'))
%         ssc_build variableOrificeComponents
%     elseif exist('variableOrificeComponents_lib','file')
%         % If the component library does exist but under a different release,
%         % rebuild it in the current version
%         info = Simulink.MDLInfo('variableOrificeComponents_lib');       
%         if isempty(strfind(info.ReleaseName, version('-release')))
%             ssc_build variableOrificeComponents
%         end
%     end
%     cd(rootFolder)
% end
% % If your demo uses REFPROP consider including this (check out Common\REFPROP for testREFPROP.m)
% if(exist('C:\Program Files (x86)\REFPROP','dir')==7)
%     disp('REFPROP previously installed')
%     addpath('C:\Program Files (x86)\REFPROP');
%     testREFPROP
% else
%     disp('REFPROP not installed')
% end

end


