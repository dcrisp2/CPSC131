function [ data ] = rolldice( printresults, sides, dice, N )
	% rolldice simulates 'N' rolls of two fair dice. print results=true
	% will display textual output per roll, false will display results in
	% bar chart along with probabilities based on those rolls.

    % make printresults into something easier to use
    switch printresults
        case 'true'
            printIt = 1;
        case 'false'
            printIt = 0;
    end
    
	% Create randomized data for each roll of each dice.
    rng('shuffle'); %seed random number generator with time
	data = rand(N, dice);
	for i=1:N
		for j=1:dice
		data(i,j) = ceil(sides*data(i,j));
			if j == dice
					
				% Put sum of dice values into a new column at the given roll
				% index.
				data(i,dice+1) = sum(data(i,:));
			end
		end
	end
    
	% Create array num for holding number of times each possible side-total was rolled
	roll_sums(dice*1:dice*sides) = [0];
	
	% Add each time a roll-total was rolled to the correct element of 'num'.
	for i=1:N
		rollSum = data(i,dice+1);
		roll_sums(rollSum) = roll_sums(rollSum) + 1;
        if printIt==1 display_line( data(i,:)); end
    end
    
    if printIt==0 bar_prob(roll_sums, N); end
    
    fprintf('\n\n');
end

function display_line( data )
    %display_line takes an array. 2 nums 1:6, and their sum. and displays a
    %line of output.
    
    sum = data(3);

    str = string(sum);
    if sum==2
        str = 'snake eyes';
    elseif sum==3
        str = 'ace-deuce';
    elseif sum==11
        str = 'yo';
    elseif sum==12
        str = 'boxcars';
    elseif sum==7
        str = 'natural';
    elseif data(1)==data(2)
        if data(1)==2
            str = 'hard four';
        elseif data(1)==3
            str = 'hard six';
        end
    end
        
    fprintf('\nPlayer rolls a %i and a %i : %s',data(1),data(2),str);
end

function bar_prob(roll_sums, N)
	% Calculate probability from simulation
	prob(:) = 100*roll_sums(:)/N;
        
	% Display bar graphs of roll total results, and probabilities.
	subplot(2,1,1); bar(roll_sums);
	title('Dice Simulation'); xlabel('Roll Total'); ylabel('# Times Rolled');
	grid on
	subplot(2,1,2); bar(prob);
	xlabel('Roll Total'); ylabel('% Probability');
	grid on
end