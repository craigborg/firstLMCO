# The Framework - An Agile Framework for MATLAB applications

The Framework (henceforth fw) is a utility that allows rapid construction 
of MATLAB applications. 

## Usage
The tool is currently a command line only tool.

    fw [command] [arguments] [options]

## Examples:
    fw -setup % one-time configuration
  
## Creation:
    fw new APP_PATH [options]
    
## Generators and Destructors:
	fw create function MyFunction
	fw create script MyScript
	fw create test [unit/functional/performance] MyUnitTest
	fw create package MyPackage
	fw create class MyPackage.MyClass
	fw destroy class MyPackage.MyClass
	fw create method MyPackage.MyClass MyMethod
	fw create template MyTemplate
  
## Workflow:
Requires git flow for an nvie branching workflow.

	fw feature start ThisIsMyNewFeature
	fw feature finish ThisIsMyNewFeature
	fw release [start/finish] v1.0
	fw commit
	fw status
	fw log
    
## Testing:
    fw test all
  
## MATLAB Path Management:
	fw startup;
	fw shutdown;
	fw reset;
	fw prune;
  
## Security and Version control:
	fw create key MyKey;  % useful for git back-end authentication
	fw cleanup;           % removes the index.lock file on git
  
## Misc Notes:
   
The 'fw new' command creates a new MATLAB application with a default
directory structure and configuration at the path you specify.
  
Example:
  fw new MyApp
  
This generates a skeletal MATLAB application in MyApp.
See the README in the newly created application to get going.

## References:
