function pathList = getProjectPath()

    
    thisProject       = slproject.getCurrentProject;
    projectFileLabels = [thisProject.Files.Labels];
    hasPathCategory   = strcmp('On Path', {projectFileLabels.CategoryName});
    isYes             = strcmp('Yes', {projectFileLabels.Name});
    isOnPath          = hasPathCategory & isYes;
    
    pathList = {projectFileLabels(isOnPath).File}';

end
