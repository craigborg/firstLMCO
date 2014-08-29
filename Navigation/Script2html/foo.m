%% Test Document
% Using the simple "matlab:[some_command] Some Command" provides the
% capability from within the MATLAB browser to execute [some_command] in
% the base workspace.  [some_command] cannot have any spaces as the first
% space detected denotes the begining of the displayed link.
%
% Note also that all sections have their % signs going from beginning to
% end.  If you place any empty lines, the lines after the break are
% displayed as m-code.  Check out second example for an example of this.

%% First example
% Click on this link to generate a simple 2D plot.
%
% [mlbegin] Simple 2D plot
% place whatever MATLAB commands you would like here      
      
      plot(rand(1,20));
      
% [mlend]
%
% [mlbegin] Other link

disp('hello world');

% [mlend]
      
%% Second example
% Click on this link to generate a simple 3D plot
%
% [mlbegin] Simple 3D plot

      surf(peaks);
      
% [mlend]
%
% * More [mlbegin] Stuff

surf(peaks);

% [mlend]
%
% These lines will be displayed as HTML because they directly follow the
% end tag.  After this line, there will be a break in the % signs to 
% demonstrate what the publisher does with the lines thereafter.

% The publisher is going to display this section of code as commented
% m-code and not as HTML content because there was an empty line prior to
% it.

%% Third example
% [mlbegin:execute] Bigger example
% These lines will be included as comments within the script file because
% they come after the beggining of a code segment.  They will also be
% displayed in the HTML document because we are using the EXECUTE option.

% Again, this paragraph will appear as commented code because of the break 
% in the % signs.  However, it will also appear in our generated companion
% script m-file.

x = 10;
x2 = x;
load clown; image(X); colormap(map);
      
% [mlend]

%% Fourth example
% Click on this link to open up the demo facility
%
% [mlbegin] Open demo page
% Open the demo facility to the Signal Processing demos

      demo toolbox signal

% [mlend]

%% Fifth example
% Click on this link to open up the documentation
%
% [mlbegin] On-line documentation
% Open the documentation to the Image Processing toolbox

      doc images  
      
%[mlend]

%% Sixth example
% [mlbegin:code]
% In this example we are going generate a link for each line of code, allowing
% us to step through the code line-by-line via links.  One of the code
% segmetns is also very long and uses the ...

msgbox({'Testing of ellipsis use', ...
        'and how the link displays in the HTML document'}, ...
        'Test Message');

x = 10;
x2 = x;
load clown; image(X); colormap(map);
      
     
% [mlend]
