function [ root ] = NewtonRaphson( f, symVar, start, tolerance )
    %NewtonRaphson Finds the root of a function using Newton Raphson, an
    %initial value for the independant variable. The method will continue
    %to iterate until the last and current iterations arrive at root values
    %within the given tolerance (use 85 for %85).

    % Clear Screen
    clc;
    
    % Definitions
    t = symVar; %This isn't necessary. var just has to be type sym.
    fdifft = diff(f,t);
    x = start;
    
    % Print Info
    fprintf('A root is estimated for the below function.\nThe method uses the initial guess of %f and continues to iterate \nuntil the last and current root values are within %f percent.\n\n',start,tolerance);
    disp('FUNCTION:');
    pretty(f)
    
    % Print header to display
    fprintf('DATA:\ni\tt\t\t\tf(t)\t\tdfdt\t\txnew\t\terror\n');
    
    % Display values from estimating iterations
    OK=1; i = 1; error = 100;
    while(OK)
        xnew = x-(subs(f,t,x)/subs(fdifft,t,x));
        fprintf('%d\t%f\t%f\t%f\t%f\t%f\n',i,x,subs(f,t,x),subs(fdifft,t,x),xnew,error);
        error = abs((x-xnew)/xnew)*100;
		
        % If percent difference between 'x' and 'xnew' is at or
        % above tolerance value, set OK to false to exit loop.
        if (error<tolerance)
			OK = 0;
			fprintf('%d\t%f\t%f\t%f\t%f\t%f\n',i,x,subs(f,t,x),subs(fdifft,t,x),xnew,error);
		end
		
        x = xnew; i=i+1;        
    end
    
    root = x;
    fprintf('\nANSWER:\nThe root was estimated to be %f\n\n',root);
end

