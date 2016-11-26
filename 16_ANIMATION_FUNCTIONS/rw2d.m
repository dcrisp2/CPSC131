function rw2d(x0, y0, N)
    %Animation of the random walking of a 'person' making 'N' steps of 
    %length 1 in only one of the four cardinal directions...
    %North, South, East or West. x0 and y0 are starting positions.
    %% Set Walk Parameters
    [x0,y0,N] = request(x0,y0,N);
    
    %% Initialize Arrays
    X(1:N) = 0;
    Y(1:N) = 0;
    
    %% Calculate Walk
    [X,Y] = calculate_walk(x0,y0,N);
    
    %% Plot Walk
    plot_walk(X,Y);
end

function [x0,y0,N] = request(x0,y0,N)
    %Clear console
	clc;

    %Display initially sent values
    fprintf('\nThe 2d walk will start at x = %i, and y = %i.',x0,y0);
    fprintf('\nAnd there will be %i steps.\n\n',N);
    
    %Request
    prompt = 'Do you want to input different values? Y/N...\n';
    response = input(prompt,'s');
    
    %If yes, request new
    if response =='Y'||response=='y'
        clc;
        x0 = input('\nPlease enter a new x0 to start at: ');
        y0 = input('\nPlease enter a new y0 to start at: ');
        N = input('\nPlease enter the number of steps "N" you want taken: ');
        clc;
        fprintf('\nStarting at ( %i , %i ), and taking %i steps...\n\n',x0,y0,N);
    end
end

function [X,Y] = calculate_walk(x0,y0,N)
    
    X(1) = x0; Y(1) = y0;
    
    for i=2:N
        %Each random step is of length 1, and in one of the four cardinal
        %directions
        idirection = randi(4);
        switch idirection
            case 1
                % One step North
                X(i) = X(i-1);
                Y(i) = Y(i-1)+1;
            case 2
                % One step South
                X(i) = X(i-1);
                Y(i) = Y(i-1)-1;
            case 3
                % One step East
                X(i) = X(i-1)+1;
                Y(i) = Y(i-1);
            case 4
                % One step West
                X(i) = X(i-1)-1;
                Y(i) = Y(i-1);
        end
    end
end

function plot_walk(X,Y)
    % Draw the person's walk path
    Xlen = length(X);
    for i = 2:Xlen
        plot(X(1), Y(1), 'r*', ...
            X(1:i), Y(1:i), ...
            X(i), Y(i), 'ro');
        axis equal
        drawnow
    end
end