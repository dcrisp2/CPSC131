function [ data ] = DiceProb( dice, sides, rolls)
	% DiceProb Lets user display results of a dice rolling simulation as a
	% bar graph.

	% Create randomized data for each roll of each dice.
	data = rand(rolls, dice);
	for i=1:rolls
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
	for i=1:rolls
		rollSum = data(i,dice+1);
		roll_sums(rollSum) = roll_sums(rollSum) + 1;
	end

	% Calculate probability from simulation
	prob(:) = 100*roll_sums(:)/rolls;
        
	% Display bar graphs of roll total results, and probabilities.
	subplot(2,1,1); bar(roll_sums);
	title('Dice Simulation'); xlabel('Roll Total'); ylabel('# Times Rolled');
	grid on
	subplot(2,1,2); bar(prob);
	xlabel('Roll Total'); ylabel('% Probability');
	grid on
end