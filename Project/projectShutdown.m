function projectShutdown()
    
    thisProject = slproject.getCurrentProject;
    rootFolder  = thisProject.RootFolder;
    
    removeProjectPath;
    
    cd(rootFolder);

end


