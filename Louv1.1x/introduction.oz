% Exercise: BrowseX
local X = (6+5)*(9-7) in
    {Browse X}
end

% Exercise: Scope
local P Q X=1 Y=2 Z=3 in
    fun {P X}
        X*Y+Z
    end
    fun {Q Z}
        X*Y+Z
    end
    {Browse {P 0} == 3}
    {Browse {Q 0} == 2}
end

% Exercise: CalledOnlyOnce
declare
fun {SlowComputation X Y}
    {Delay 1000}
    X + Y
end

local X in
    X = {SlowComputation 1 1} * 3
    {Browse X}
end