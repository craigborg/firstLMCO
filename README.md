# Initial Git Setup Instructions:

(Everyone must perform these quick initial steps in order to be able to communicate with the MathWorks Git Server)

 

## a.       First, download command-line Git from here:

http://msysgit.github.io/

 

Once downloaded, run the Git installer.
* Choose the install option to run Git from the Windows command prompt. This option will add Git to your PATH variable, so that the Simulink Project can communicate with Git.
Use the default OpenSSH option.
Choose the option, "Checkout as-is, commit as-is" to avoid converting any line endings in files.
As required: Review git-scm.com's doc on first time setup (Git Book Chapter 1.5 Getting Started - First-Time Git Setup)
* It also works to edit the PATH variable manually, even if Git is already installed. Just attach <;C:\Program Files (x86)\Git\bin;C:\Program Files (x86)\Git\cmd?> to the PATH variable (Control panel -> System ->Advanced System Settings ->Environment Variables -> System Variables).
 

## b.      Next, Create an account on GitLab here:

insidelabs-git.mathworks.com (login/password is your inside MathWorks login/password; e.g. dmeissne)

 

## c.       If you've already created an SSH key for Git:
refer to http://git-scm.com/book/en/Git-on-the-Server-Generating-Your-SSH-Public-Key

Use a brand new folder name to download your id_rsa and id_rsa.pub into, e.g. c/temp/id_rsa

 
## d.      If you haven't already created an SSH key for Git:
   Add an SSH key to your insidelabs-git.mathworks.com profile:

Open a Git Bash Terminal (Start Menu -> Programs -> Git)
Type into terminal window: ssh-keygen -t rsa -C yourMWusername@mathworks.com
Choose the default location (i.e. hit "Enter" button)
Choose a password (recommend using the same password that was used for your new GitLab account)
Go to newly created .ssh folder and open the "id_rsa" Pub file with a text editor
Copy long SSH Key string within this file
Navigate to http://insidelabs-git.mathworks.com/profile/keys, and add your copied SSH Key
 

 

# New Simulink Project Instructions:

Skip to step 5, if a project already exists on the MathWorks GitLab Server, and you simply wish to download the demo using the project's HTTP URL (e.g. http://insidelabs-git.mathworks.com/jeremyr/robot-arm.git)

 

## 1.) Sign In:
In a Web Browser, sign into your insidelabs-git.mathworks.com account 
(http://insidelabs-git.mathworks.com/)

## 2.) New Project:
From the Dashboard, click on "New Project" (green button on right-hand side of page)

## 3.) Create Project:
Provide a project name, description, visibility level, and click "Create Project"

## 4.) SSH:
On the newly created project page, SSH should have black text as the default selection, if not, click 'SSH'?, and copy the project's "git@..." url

## 4a.) Settings:
Click the 'Settings' tab and add members/developers that you would like to collaborate with on your new project

 

## 5.) In MATLAB:
click "New" (drop down arrow) -> Simulink Project -> From Source Control

Source control integration: Git
Repository path: paste the copied git url (from Step 4)
Sandbox: C:\path_to_an_empty_folder_on_your_computer
Click the Retrieve Button
You will get a message asking you if you want to continue because you haven't entered the password created in the initial set up step "d", click yes and enter it.
The AE may stop after this step if their goal was simply to gain access to another AE's demo

 

## 6.) New Simulink Project:
If asked to Create a New Simulink Project, click 'Yes'

Template: Add the AEG Demo Template if you are creating a demo from scratch (optional)
See \\mathworks\AH\Public\David_Meissner\SimulinkProjects for a .zip to add to your Simulink Project Template Path OR pull down the template as a version controlled project in Simulink Project from http://insidelabs-git.mathworks.com/dmeissne/coredemotemplategit.git (this would be that path pasted in step 5 above)
Project definition files: Use multiple project files
Source control integration: Click "Detect" button, and Git source control will appear (otherwise, select "Git")
Click "Create" button to create a new Simulink Project

## 7.) Push your project online:
Add project files, Commit changes to Local Repository, and Push to Online Git Repository

Copy any desired files from another directory into your newly created project's sandbox directory
From the "All Files" View in the Simulink Project window, select the files you wish to add to your project -> Right Click -> Add to Project (or Add Folder to Project) OR drag a label from the Labels sub-window to the file.
Select the "Modified Files" View
Note: If any additions/modifications will need to eventually be merged by another user (i.e. into a master branch), then it is recommended you select the files and click "Label for Review" (found in the "Precommit Actions" of Modified Files View)
Click on "Commit Modified Files" to commit changes to your local sandbox repository
Select "Push" from the Git sub-window to move your recently updated project to the project's online git repository
Sign in when prompted using your insidelabs-git.mathworks account

## 8.) Branching:
Create a personal/new branch (when desired):

Click on "Manage Branches" in the Simulink Projects window (Git sub-window)
Choose a Branch from the drop-down menu and highlight a date/time stamp from the list that you wish to create a new branch (most recent on top)
Give your branch a name (i.e. JeremyBranch), and push "Create" button. 
From the Branches dropdown select the branch you just created, i.e. JeremyBranch.
Close Manage Branches Tool
Select "Push" button from the Git sub-window to move your updated branch to the online GitLab repository
Sign in when prompted using your insidelabs-git.mathworks account

## 9.) Switch branches (when desired):

Click on "Manage Branches" in the Simulink Projects window (Git sub-window)
Select the Branch from the drop-down menu you wish to work on
Click the "Switch" button (Note: You cannot switch to an online/remote repository branches)
Close Manage Branches Tool

## 10.)  Fetch/Merge:
Fetch and Merge another developer's updates into your branch (when desired):

Perform this step after being notified of changes by an owner or a developer on your team

Select "Fetch" button to grab the latest online repository information
Sign in when prompted using your insidelabs-git.mathworks account
Click on "Manage Branches" in the Simulink Project window
Switch to the desired branch where changes will be imported (Step 9, but leave Manage Branches Tool open)
Select online repository branch (e.g. ref/remotes/origin/JeremyBranch) that contains your developer's recently pushed updates
Click the "Merge" button to import the developer's latest changes
Close Manage Branches Tool
Select the "Project Files" View
Select the 'Filter' Icon, and filter on "To Review" Labels to see if there are any files that were marked for peer review
Right click on files that require peer review -> select "Compare to Revision" -> select a file revision you wish to compare to the latest version (listed chronologically, from top to bottom)
If the change was undesired, then select the file -> Right Click -> Revert using Git, and choose the previous version
 

 

Additional Recommended Actions for Project Robustness:

 

## 11.)  Protect: 
Protect your master branch from other developers being able to push changes to your 'golden copy':

Navigate to your 'Commits' tab on your insidelabs-git.mathworks project's website:
Select 'Branches' sub-tab
Select Protected view -> Choose your master branch -> Click 'Protect'

## 12.)  Dependency Analysis:
See how your projects files are related, dependent on one another, or unable to find a referenced file:

In Simulink Projects, Select the "Dependency Analysis" view
Click on "Analyze"
Select the "Impact" sub-view

## 13.)  Integrity Checks:
Run integrity checks for missing files, files not in source control, and files not added to the project:

In Simulink Projects, Select the "Modified Files" View
Click "Check Project" in the Precommit actions sub-window
Review findings and fix problems if necessary