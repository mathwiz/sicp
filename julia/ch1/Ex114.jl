"""
# module Ex114


# Examples

```jldoctest
julia> include("c:/Users/Yohan/IdeaProjects/sicp/julia/ch1/exXXX.jl")

julia> ExXXX.func(arg)
```
"""
module Ex114

count_change(amount) = cc(amount, 5)


function biggest_denomination(kinds_of_coins)
    if kinds_of_coins == 1
        return 1
    elseif kinds_of_coins == 2
        return 5
    elseif kinds_of_coins == 3
        return 10
    elseif kinds_of_coins == 4
        return 25
    elseif kinds_of_coins == 5
        return 50
    end
end


function cc(amount, kinds_of_coins)
    if amount == 0
        return 1
    elseif amount < 0 || kinds_of_coins == 0
        return 0
    else
        return cc(amount, kinds_of_coins - 1) + cc(amount - biggest_denomination(kinds_of_coins), kinds_of_coins)
    end
end

end
