timeStamp = char(datetime('now','Format','yyyy-MM-dd HH:mm:ss'));
thisProject = slproject.getCurrentProject;
projectName = thisProject.Name;
fileName = [projectName,timeStamp]