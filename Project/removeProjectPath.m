function removeProjectPath()
    pathList = getProjectPath;
    cellfun(@rmpath, pathList);
end
    