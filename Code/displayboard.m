function [] = displayboard(inputBoard)
% DISPLAYBOARD Display the board on command window with current input board
%   INPUT
%   inputBoard - current 3x3 array consisting of 0's , 1's , 2's
%
%   OUTPUT
%   [] - None. Commands within function will print board in command window

    % MINIMUM NARGIN CHECK:
    if nargin ~= 1
    error("ITP168:nargin", "Need one input")
    end
    
    % FIRST INPUT CHECK:
    % Check if numeric and is 3x3
    if ~isnumeric(inputBoard) || size(inputBoard, 1) ~= 3 || size(inputBoard, 1) ~= 3
    error("ITP168:input", "Input needs to be 3x3 numeric array")
    end
    
    % Check for 0, 1, 2
    for row = 1:3
        for column = 1:3
            if inputBoard(row,column) ~= 0 && inputBoard(row,column) ~= 1 && inputBoard(row,column)~= 2 
                error("ITP168:input", "Input can only consist of 0's, 1's, 2's")
            end
        end
    end

    % Displaying the board
    % 0 = empty
    % 1 = X
    % 2 = O
    for row = 1:3
        for column = 1:3
            if inputBoard(row,column) == 0
                fprintf("_")
            elseif inputBoard(row,column) == 1
                fprintf("X")
            else
                fprintf("O")
            end
            
            if column == 1 || column == 2
                fprintf(" | ")
            end
        end
        if row == 1|| row == 2
            fprintf("\n---------\n")
        elseif row == 3
            fprintf("\n")
        end
    end
end
        
% Le Duong
% ITP 168 Spring 2023
% Lnduong@usc.edu

% Display Board
