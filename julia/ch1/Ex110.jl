#=
Ex110:
- Julia version: 0.6.4
- Author: Yohan
- Date: 2018-08-03
=#

module Ex110

function a(x, y)
    if y == 0
        return 0
    elseif x == 0
        return 2 * y
    elseif y == 1
        return 2
    else
        a(x - 1, a(x, y - 1))
    end

end

f(n) = a(0, n)

g(n) = a(1, n)

h(n) = a(2, n)

k(n) = 5 * n * n

end
