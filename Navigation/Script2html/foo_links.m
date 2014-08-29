switch linkClicked,

case('link1'),
% place whatever MATLAB commands you would like here      
      
      plot(rand(1,20));
      

case('link2'),

disp('hello world');


case('link3'),

      surf(peaks);
      

case('link4'),

surf(peaks);


case('link5'),
% These lines will be included as comments within the script file because
% they come after the beggining of a code segment.  They will also be
% displayed in the HTML document because we are using the EXECUTE option.

% Again, this paragraph will appear as commented code because of the break 
% in the % signs.  However, it will also appear in our generated companion
% script m-file.

x = 10;
x2 = x;
load clown; image(X); colormap(map);
      

case('link6'),
% Open the demo facility to the Signal Processing demos

      demo toolbox signal


case('link7'),
% Open the documentation to the Image Processing toolbox

      doc images  
      

case('link8'),
msgbox({'Testing of ellipsis use', ...
        'and how the link displays in the HTML document'}, ...
        'Test Message');

case('link9'),
x = 10;

case('link10'),
x2 = x;

case('link11'),
load clown; image(X); colormap(map);

end
