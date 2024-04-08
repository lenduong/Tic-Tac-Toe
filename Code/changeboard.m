function [inputBoard] = changeboard(inputBoard, selectedPosition, character)
% CHANGEBOARD Update the current inpputBoard with the new selected position 
%   INPUT 
%   inputBoard - current 3x3 array consisting of 0's , 1's , 2's 
%   selectedPosition - the selected position to place the character
%   character - the player's character (X or O)
%   
%   OUTPUT
%   inputBoard - new updated inputBoard. current inputBoard with new the selected position. 

    % MINIMUM NARGIN CHECK:
    if nargin ~= 3
        error("ITP168:nargin", "Need board input and new selected position")
    end

    % FIRST INPUT CHECK:
    % Check if input board is numeric and is 3x3
    if ~isnumeric(inputBoard) || size(inputBoard, 1) ~= 3 || size(inputBoard, 1) ~= 3
    error("ITP168:nargin", "Input needs to be 3x3 numeric array")
    end 
    % Check if input board only contains 0, 1, 2
    for row = 1:3
        for column = 1:3
            if inputBoard(row,column) ~= 0 && inputBoard(row,column) ~= 1 && inputBoard(row,column)~= 2 
                error("ITP168:input", "Input can only consist of 0's, 1's, 2's")
            end
        end
    end

    % SECOND INPUT CHECK:
    % Create a row vector to check if selected row & column is a member of
    validRowColumn = [1,2,3];

    % Check if selected position is numeric, is a two element row vector,
    % and contains only positive integer values that are valid row/column
    % for the board (so any value from 1-3 for each row and element)
    if ~isnumeric(selectedPosition) || ~isRowVectorWithLength(selectedPosition, 2) || ~ismember(selectedPosition(1),validRowColumn) || ~ismember(selectedPosition(2),validRowColumn)
        error("ITP168:input", "Selected position needs to be numeric, 2x1 row vector, and contain valid row/column values from 1-3")
    end

    % THIRD INPUT CHECK:
    % Create vector for valid character
    validCharacter = ['X', 'O'];
    % Check if 3rd input in a character, a scalar, and is either an X or O
    % (CAPITALLIZED)
    if ~ischar(character) || ~isscalar(character) || ~ismember(character, validCharacter)
        error("ITP168:input", "Character input needs to be a single character, either 'X' or 'O'")
    end

    % Update the board with character
    % Return the board as the output to the function
    % 1 = X
    % 2 = O
    if character == 'X'
        inputBoard(selectedPosition(1),selectedPosition(2)) = 1;
    else
        inputBoard(selectedPosition(1),selectedPosition(2)) = 2;
    end
end

% Le Duong
% ITP 168 Spring 2023
% Lnduong@usc.edu

% Change Board
