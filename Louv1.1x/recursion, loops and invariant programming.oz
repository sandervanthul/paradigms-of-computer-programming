% Factorial using recursion
declare fun {FactR N}
    if N == 0 then 1
    else N * {FactR N-1} end
end
{Browse {FactR 5}}

% Factorial using loop/tail-recursion
declare fun {Fact N}
    local FactR in fun {FactR N A}
            if N == 0 then A
            else {FactR N-1 A*N} end
        end
        {FactR N 1}
    end
end
{Browse {Fact 5}}

% SumDigits using recursion
declare fun {SumDigitsR N}
    if (N div 10) == 0 then N
    else
        (N mod 10) + {SumDigitsR (N div 10)}
    end
end
{Browse {SumDigitsR 123}}

% SumDigits using loop/tail-recursion
declare fun {SumDigits N}
    local SumDigitsR in fun {SumDigitsR N A}
            if N == 0 then A
            else
                {SumDigitsR (N div 10) (A + (N mod 10))}
            end
        end 
        {SumDigitsR N 0}
    end 
end
{Browse {SumDigits 123}}

% Exercise Sum
declare fun {MainSum N}
    local Sum in fun {Sum N Acc}
            if N == 0 then Acc
            else {Sum N-1 Acc+(N*N)} end
        end
        {Sum N 0}
    end
end
{Browse {MainSum 4}}

% Exercise Mirror
declare fun {MainMirror Int}
    local Mirror in fun {Mirror Int Acc}
            if Int == 0 then Acc
            else {Mirror (Int div 10) (Acc * 10 + (Int mod 10))} end
        end
        {Mirror Int 0}
    end
end
{Browse {MainMirror 12345}}

% Exercise Prime
declare fun {Prime N}
    local PrimeR in fun {PrimeR N A}
            if A =< 2 then true
            elseif (N mod A) == 0 then false
            else {PrimeR N A-1} end
        end

        if N =< 1 then false
        elseif (N mod 2) == 0 then false
        else {PrimeR N (N div 2)} end
    end 
end
{Browse {Prime 7}}    % prime
{Browse {Prime 10}}   % not prime 
{Browse {Prime 1223}} % prime
{Browse {Prime 1227}} % not prime

% Pow using loop/tail-recursion
declare fun {Pow N E}
    local PowR in
        fun {PowR N E A}
            if E == 0 then A 
            else {PowR N E-1 A*N} end
        end
        {PowR N E 1}
    end
end
{Browse {Pow 3 4}}

% Pow using loop/tail-recursion with optimization
declare fun {Pow N E}
    local PowR in
        fun {PowR N E A}
            if E == 0 then A 
            elseif (E mod 2) == 0 then
                {PowR N*N (E div 2) A}
            else 
                {PowR N E-1 A*N}
            end
        end
        {PowR N E 1}
    end
end
{Browse {Pow 3 4}}

% Exercise Fibonacci
declare
fun {Fib N}
    local FibAux in
        fun {FibAux N Acc1 Acc2}
            if N == 1 then Acc2
            else {FibAux N-1 Acc2 Acc1+Acc2} end
        end
        {FibAux N 0 1}
    end
end
{Browse {Fib 34}}

% Naive Fibonacci
declare
fun {FibN N}
    if N == 0 then 0
    elseif N == 1 then 1
    else {FibN N-1} + {FibN N-2} end
end
{Browse {FibN 34}}