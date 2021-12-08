"""
```jldoctest
julia> include("c:/Users/Yohan/IdeaProjects/sicp/julia/ch1/ExXXX.jl")

julia> ExXXX.func(arg)

or
shell> julia ExXXX.jl
```
"""
module Ex128

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

function fermat_test(n)
    try_it(a) = expmod(a, n, n) == a
    return try_it(1 + random(n - 1))
end

function fast_prime(n, times)
    if times == 0
        return true
    elseif fermat_test(n)
        return fast_prime(n, times-1)
    else
        return false
    end
end 

function miller_rabin_test(n)
    try_it(a) = miller_rabin_expmod(a, n-1, n) == 1
    return try_it(1 + random(n - 1))
end

function fast_miller_rabin(n, times)
    if times == 0
        return true
    elseif miller_rabin_test(n)
        return fast_miller_rabin(n, times-1)
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

function non_trivial_square_root(x, square, m)
    result = (1 == square) && (x != 1) && (x != m-1)
    return result ? 0 : square
end

function miller_rabin_expmod(base, exp, m)
    squaremod_with_check(x) = non_trivial_square_root(x, rem(sq(x), m), m)
    if exp == 0
        return 1
    elseif divides(2, exp)
        return squaremod_with_check(miller_rabin_expmod(base, div(exp,2), m))
    else
        return rem(base * miller_rabin_expmod(base, exp-1, m), m)
    end
end

random(limit) = rem(abs(rand(Int, 1)[1]), limit)

function test_case(n)
    p = prime(n)
    fp = fast_prime(n, fast_times)
    mr = fast_miller_rabin(n, fast_times)
    return "$n \t Prime: $p \t Fast Prime: $fp \t Miller-Rabin: $mr"
end

end

# testing
# primes
println(Ex128.test_case(11))
println(Ex128.test_case(13))
println(Ex128.test_case(97))
# composite numbers
println(Ex128.test_case(10))
println(Ex128.test_case(77))
println(Ex128.test_case(6603))
# Carmichael numbers
println(Ex128.test_case(561))
println(Ex128.test_case(1105))
println(Ex128.test_case(1729))
println(Ex128.test_case(2465))
println(Ex128.test_case(2821))
println(Ex128.test_case(6601))

println("done")
