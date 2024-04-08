% Le Duong
% ITP 168 Spring 2023
% Homework 4
% Lnduong@usc.edu
% **Student info are at the bottom for all functions**

% Game

clear; clc; 

% The entire game is in one big while loop
% The loop remains true if the player's answer remain 'y' or 'Y' (for yes, keep playing the game)
% If player insert 'n' or 'N' (for no, stop the game)
playersChoice = 'y';
while strcmpi(playersChoice, 'y')
    % ONE: Set up empty board
    fprintf("Let's play Tic-Tac-Toe!\nPlayer X's turn\n")
    inputBoard = newboard();
    displayboard(inputBoard)
    % Since steps 2-8 will repeat until there is a stalemate or winner, we put it in a while loop
    % If there is a winner or stalemate, the while loop will become false and stop
    result = 'N';
    player = 1;
    while result == 'N' 
        % TWO: Start with appropriate player (1st player is X)
        % We use variable "player" as counter for whose turn it is. 
        % rem(player,2) == 0 means even number, ~=0 means odd
        % Odd means it is player X's turn (since "player" is an odd number at the start of the loop) even means O
        if rem(player,2) == 0
            character = 'O';
        else
            character = 'X';
        end
        % Print player's __ turn
        if player ~= 1
            fprintf("Player %s's turn\n", character)
        end
    
        % THREE: Ask player __ to select a position on the board
        % Select row then column
        % If either position is invalid, ask player to select again
        validSelection = [1,2,3];
        % Get player's row input
        playerRow = input("Select row: ");
        % MATLAB will take empty matrix as a valid member so we must account for empty inputs as well
        while isempty(playerRow)
            playerRow = input("Invalid row, reselect row: ");
        end
        while ~ismember(playerRow,validSelection) || isempty(playerRow)
            playerRow = input("Invalid row, reselect row: ");
        end
        % Get player's column input
        playerColumn = input("Select column: ");
        while isempty(playerColumn)
            playerColumn = input("Invalid column, reselect column: ");
        end
        while ~ismember(playerColumn,validSelection)
            playerColumn = input("Invalid column, reselect column: ");
        end 

        % FOUR: Check if move is valid using isvalidmove function
        % If not, return to step 3
        % The nested while loops below combine steps 3&4
        while ~isvalidmove(inputBoard,[playerRow,playerColumn])
            % If it gets to this line, the move is invalid and we're repeating step 3
            % Get player's row input
            playerRow = input("Select row: ");
            while isempty(playerRow)
            playerRow = input("Invalid row, reselect row: ");
            end
            while ~ismember(playerRow,validSelection)
                playerRow = input("Invalid move, reselect row: ");
            end
            % Get player's column input
            playerColumn = input("Select column: ");
            while isempty(playerColumn)
            playerColumn = input("Invalid column, reselect column: ");
            end
            while ~ismember(playerColumn,validSelection)
                playerColumn = input("Invalid move, reselect column: ");
            end 
        end
        
        % FIVE: If move is valid, update the board with the player's character and display new board
        inputBoard = changeboard(inputBoard, [playerRow,playerColumn], character);
        displayboard(inputBoard)
    
        % Calculate result:
        result = checkwinner(inputBoard);
    
        % SIX & SEVEN: If there is a winner or stalemate, print winner or stalemate. Game is over. Move to step 9
        if result == 'X' || result == 'O'
            fprintf("Player %s WINS!\n",character)
        elseif result == 'S'
            fprintf("Stalemate reached!\n")
        end
        
        % EIGHT: add 1 to counter "player" to switch to other player (will only switch if there is no winner nor stalemate)
        player = player + 1;
    end

    % NINE: ask if user wants to play again
    playersChoice = input("Would you like to play again (y/n)? ", 's');
    while ~strcmpi(playersChoice, 'y') && ~strcmpi(playersChoice, 'n')
         playersChoice = input("Would you like to play again (y/n)? ", 's');
    end
end

