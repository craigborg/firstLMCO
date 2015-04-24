%¤º`°º¤ø,¸¸,ø¤º°`°º¤ø,¸¸,ø¤º°`°º¤ø,¸¸,ø¤º°`°º¤ø,¸¸,ø¤º°`°º¤ø,¸¸,ø¤º°`°º
% PROGRAM:        String to Variable
% VERSION:        1.02
% AUTHOR(S):      William B. Campbell
% FIRST MODIFIED: January 2006
% LAST MODIFIED:  February 2007
%
% USAGE: str2var(mystring,[maxchars])
%
% Sometimes a programmer wishes to take a filename or other string of text
% and assign a variable based on that name. This can be problematic if the
% string contains spaces, colons, commas, or other characters not valid for
% a Matlab internal variable. It can also be problematic if the string is
% greater than 63 characters since Matlab will have to truncate it.
% This routine will solve all that by preparing a string to be used in
% assigning an internal variable.
%
% An optional input, maxchars, can be supplied if the user wants a variable
% less than 63 characters. This can be useful if you want to take your
% string and append some known suffix to it (i.e. you want all strings to
% contain '_cell' on the end).
% 
% INPUTS:
% NAME          TYPE            DESCRIPTION
% mystring      1xn string      Matlab string variable
% maxchars      1x1 integer     optional limit to length of the output
%
% OUTPUTS:
% NAME          TYPE            DESCRIPTION
% varstring     1xp string      Matlab string variable able to be the name
%                               of a Matlab variable
%
% EXAMPLES:
%  str2var('What is my name? Will...') returns 'What_is_my_name_Will'
%  str2var('this is a really, really, really long string isnt it? Maybe maybe not')
%    returns 's_a_really_really_really_long_string_isnt_it_Maybe_maybe_not'
%  str2var('this is a really, really, really long string isnt it? Maybe maybe not',10)
%    returns 'Xmaybe_not'
% 
%¤º`°º¤ø,¸¸,ø¤º°`°º¤ø,¸¸,ø¤º°`°º¤ø,¸¸,ø¤º°`°º¤ø,¸¸,ø¤º°`°º¤ø,¸¸,ø¤º°`°º

function varcell = str2var(mycell,maxchars)

if nargin < 2
    maxchars = 63;
end

string_conv = false;
if ~iscell(mycell)
    mycell = cellstr(mycell);
    string_conv = true;
end
L_cell = length(mycell);

for j = 1:L_cell
    mystring = mycell{j};
    L = length(mystring);

    % Truncate as needed
    if ischar(mystring) & L > maxchars
        varstring = mystring(L-maxchars+1:L);
    else
        varstring = mystring;
    end
    L = length(varstring);

    badchars = '~`?:;,./\!@#$%^&*()"<>=+-[]{}| ';

    % Replace all bad characters with underscores
    for i = 1:length(badchars)
        varstring = strrep(varstring,badchars(i),'_');
    end

    badstarts = '1234567890_';
    % Replace any bad starts characters from first position
    for i = 1:length(badstarts)
        if strcmp(varstring(1),badstarts(i))
            varstring(1) = strrep(varstring(1),badstarts(i),'X');
        end
    end

    % Replace all double and triple underscores with singles
    varstring = strrep(varstring,'__','_');
    varstring = strrep(varstring,'__','_');

    % Clip final underscore character if it exists
    if strcmp(varstring(end),'_')
        varstring = varstring(1:end-1);
    end
    
    varcell(j) = cellstr(varstring);
end

if string_conv
    varcell = varcell{1};
end