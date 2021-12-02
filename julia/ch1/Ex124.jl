"""
```jldoctest
julia> include("c:/Users/Yohan/IdeaProjects/sicp/julia/ch1/ExXXX.jl")

julia> ExXXX.func(arg)
```
"""
module Ex124

fast_times = 3

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

# prime(n) = n == smallest_divisor(n)
prime(n) = fast_prime(n, fast_times)

function fast_prime(n, times)
    if times == 0
        return true
    elseif fermat_test(n)
        return fast_prime(n, times-1)
    else
        return false
    end
end 

function expmod(base, exp, m)
    if exp == 0
        return 1
    elseif divides(2, exp)
        return rem(sq(expmod(base, div(exp,2), m)), m)
    else
        return rem(base * expmod(base, exp-1, m), m)
    end
end

function fermat_test(n)
    try_it(a) = expmod(a, n, n) == a
    return try_it(1 + random(n - 1))
end

random(limit) = rem(abs(rand(Int, 1)[1]), limit)

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
