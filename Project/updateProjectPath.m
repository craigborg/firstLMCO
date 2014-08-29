function updateProjectPath()
    pathList = getProjectPath;
    cellfun(@addpath, pathList);
end
    