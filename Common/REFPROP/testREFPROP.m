%% Test the Connection to REFPROP
% After installing REFPROP, you can use this to test access to the database
%
%% Pull in some data to compare
% Bring in some good data pulled previously from a working database
load goodData.mat 

% Make a call to your REFPROP database (installed iaw the project doc) ;)
myData = refpropm2D('C','T',[200,290,300],'P',[100,200],'methane'); % This 
% calls for the specific heat at constant pressure for a pure methane

%% Compare
if myData == goodData
    disp('REFPROP database test: Success')
else
    disp('REFPROP database test: Failed')
end

