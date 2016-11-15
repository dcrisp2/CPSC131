function [ fib ] = fibonacci( n )
	% fibonacci.m Outputs first 'n' fibonacci numbers...

	fib(1) = 0;
	fib(2) = 1;

	for i=3:n
		fib(i) = fib(i-2) + fib(i-1);
    end
    
    fib = fib(n);
end