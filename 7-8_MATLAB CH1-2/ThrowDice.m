function [ vals, sum ] = ThrowDice( num )
    %ThrowDice: user throws num dice, function displays their values, and
    %sum.
    clc
    %vals = [1:num];
    sum = 0;
    
    disp('=======================')
    fprintf('\tThrowDice\n')
    disp('=======================')
    fprintf('\tDice(#)\t\tVal\n')
    format = '\t%1.0f\t\t\t%1.0f\n';
    for i=1:num
        
        vals(i)=randi(6);
        fprintf(format,i,vals(i))
        
        sum = sum + vals(i);
        
    end
    
    fprintf('\tSUM\t\t\t%2.0f\n\n\n',sum)
    %return vals, sum;
end
