"""
```jldoctest
julia> include("c:/Users/Yohan/IdeaProjects/sicp/julia/ch1/ExXXX.jl")

julia> ExXXX.func(arg)

or
shell> julia ExXXX.jl
```
"""
module Ex127

fast_times = 128

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

function fast_prime(n, times)
    if times == 0
        return true
    elseif fermat_test(n)
        return fast_prime(n, times-1)
    else
        return false
    end
end 

function carmichael_num(n)
    try_it(a) = a == expmod(a, n, n)
    iter(x) = x == 0 ? true : (try_it(x) ? iter(x-1) : false)
    return !prime(n) && iter(n-1)
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

function test_case(n)
    p = prime(n)
    fp = fast_prime(n, fast_times)
    car = carmichael_num(n)
    return "$n \t Prime: $p \t Fast Prime: $fp \t Carmichael: $car"
end

end

# testing
println(Ex127.test_case(10))
println(Ex127.test_case(11))
println(Ex127.test_case(13))
println(Ex127.test_case(97))
println(Ex127.test_case(561))
println(Ex127.test_case(1105))
println(Ex127.test_case(1729))
println(Ex127.test_case(2465))
println(Ex127.test_case(2821))
println(Ex127.test_case(6601))
println(Ex127.test_case(6603))
println("done")
