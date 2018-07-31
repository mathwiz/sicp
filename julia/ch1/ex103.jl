# Include with> include("c:/Users/Yohan/IdeaProjects/sicp/julia/ch1/ex103.jl")

function larger_sq(x, y, z)
    if x <= y && x <= z
        y * y + z * z
    elseif y <= x && y <= z
        x * x + z * z
    else
        x * x + y * y
    end
end
