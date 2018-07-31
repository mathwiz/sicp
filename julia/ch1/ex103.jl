function larger_sq(x, y, z)
    if x <= y && x <= z
        y * y + z * z
    elseif y <= x && y <= z
        x * x + z * z
    else
        x * x + y * y
    end
end
