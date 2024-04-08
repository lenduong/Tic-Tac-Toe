function [result] = checkwinner(inputBoard)
% CHECKWINNER Check for a winner
%   INPUT 
%   inputBoard - current 3x3 array consisting of 0's , 1's , 2's 
%   
%   OUTPUT
%   result - result of that round (stalemate, no winner, X player, or O player)

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
    for m = 1:3
        for n = 1:3
            if inputBoard(m,n) ~= 0 && inputBoard(m,n) ~= 1 && inputBoard(m,n)~= 2 
                error("ITP168:input", "Input can only consist of 0's, 1's, 2's")
            end
        end
    end

    % Determine if there is a winner, stalemate, or no winner
    % Winner = 3 of the same characters in a row (vertical, horizontal, or
    % diagonal)
    % if Winner: return winning character
    % if Stalemate: return 'S' as character output
    % if No Winner: return 'N' as character output

    % FIRST - Check for winner:
    % There are 8 possible ways to win, 3 vertical, 3 horizontal, 2 diagonal. Check each way
    result = 0;
    for m = 1:3
        n = 1;
            % Check horizontal win
            if inputBoard(m,n) == inputBoard(m,n + 1) && inputBoard(m,n + 1) == inputBoard(m,n + 2)
                if inputBoard(m,n) == 1
                    result = 'X';
                elseif inputBoard(m,n) == 2
                    result = 'O';
                end
            % Check vertical win
            elseif inputBoard(n,m) == inputBoard(n + 1,m) && inputBoard(n + 1,m) == inputBoard(n + 2,m)
                if inputBoard(n,m) == 1
                    result = 'X';
                elseif inputBoard(n,m) == 2
                    result = 'O';
                end
            end 
    end
    % Check diagonal win
    if inputBoard(1,1) == inputBoard(2,2) && inputBoard(2,2) == inputBoard(3,3) || inputBoard(3,1) == inputBoard(2,2) && inputBoard(2,2) == inputBoard(1,3)
        if inputBoard(2,2) == 1
            result = 'X';
        elseif inputBoard(2,2) == 2
            result = 'O';
        end
    end

    % If the board passes everything thus far, it means there's no winner
    
    % SECOND - Check for no winner:
    % No winner = if there's no winner and at least one zero left
    
    if result ~= 'X' && result ~= 'O'
        for row = 1:3
            for column = 1:3
                if inputBoard(row,column) == 0
                    result = 'N';
                end
            end
        end
    end

    % THIRD - Check for stalemate:
    % If there is no winner and no zero left
    if result ~= 'X' && result ~= 'O'&& result ~= 'N'
        result = 'S';
    end
end

% Le Duong
% ITP 168 Spring 2023
% Homework 4
% Lnduong@usc.edu

% Check Winner