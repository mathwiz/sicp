"""
```jldoctest
julia> include("c:/Users/Yohan/IdeaProjects/sicp/julia/ch1/ExXXX.jl")

julia> ExXXX.func(arg)
```
"""
module Ex122

sq(n) = n * n

divides(a, b) = b % a == 0

function find_divisor(n, test)
    if sq(test) > n
        return n
    elseif divides(test, n)
        return test
    else
        return find_divisor(n, test + 1)
    end
end

smallest_divisor(n) = find_divisor(n, 2)

prime(n) = n == smallest_divisor(n)

function report_prime(n)
    if prime(n)
        println("$n ***")
    else
        println("$n")
    end
end

function search_helper(n, finish)
    if n <= finish
        report_prime(n)
        search_helper(n + 2, finish)
    else
        println("finished")
    end
end

search_for_primes(start, finish) = 
    search_helper(divides(2, start) ? start + 1 : start, finish)


end
