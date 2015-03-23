%% Push Archive to Public
%
% This checks out the master branch, zips up the contents of the latest
% commit and copies it to the related public folder.
%
choice = questdlg('Sure you want to checkout master? Have you committed lower branches, merged them into the master and pushed to GitLab?', ...
    'Warning', ... % this is the title of the dialog box
    'yes','cancel','cancel'); % these are 'buttonText','buttonText2', etc... last one is the default
% Handle response
switch choice
    case 'yes'
        choice = questdlg('Double sure? This will overwrite the version in your public.', ...
            'Warning', ... 
            'yes','cancel','cancel');
        % Handle response
        switch choice
            case 'yes'
                thisProject = slproject.getCurrentProject;
                rootFolder  = thisProject.RootFolder;
                cd(rootFolder)
                !git checkout master
                !git archive -o simpleDisplay.zip HEAD
                !copy simpleDisplay.zip \\mathworks\AH\Public\David_Meissner\sharedDemos\CockpitDisplayDemo\SimpleDisplay /Y
            case 'cancel'
                disp('Operation Cancelled')
        end
    case 'cancel'
        disp('Operation Cancelled')
end
