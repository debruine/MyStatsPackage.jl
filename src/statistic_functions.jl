function printOwner
    print("@debruine")
end

function rse_sum(x) 
    mysum = 0
    for sub in x
        mysum = mysum + sub
    end

    return mysum
end

function rse_mean(x)
    return rse_sum(x) / length(x)
end

function rse_std(x)
    meandiff = x .- rse_mean(x)
    y = rse_sum(meandiff.^2) / (length(x) - 1)

    return sqrt(y)
end

function rse_tstat(x; σ = rse_std(x))
    return rse_mean(x) / (σ / sqrt(length(x)))
end


struct StatResult
    x::Vector
    n::Int64
    std::Float64
    tvalue::Float64
end

function StatResult(x)
    n = length(x)
    std = rse_std(x)
    tvalue = rse_tstat(x)
    return StatResult(x, n, std, tvalue)
end

function StatResult2(x)
    n = length(x)
    m = rse_sum(x) / n
    std = sqrt(rse_sum((x .- m).^2) / (n - 1))
    tvalue = m / (std / sqrt(n))
    return StatResult(x, n, std, tvalue)
end

import Base: print
function print(s::StatResult)
    df = s.n - 1
    roundt = round(s.tvalue, digits = 2)
    print("t($df) = $roundt")
end

import Base: length
function(length(x::StatResult))
    return x.n
end

# ## Test everything --
# using Test

# s = StatResult(2:10)
# print(s)
# length(s)

# s2 = StatResult2(2:10)

# @test rse_sum(1:36) == 666
# @test rse_mean(-15:17) == 1
# @test rse_std(1:3) == 1
# @test rse_tstat(2:3) == 5
# @test s.x == 2:10
# @test s.n == 9
# @test length(s) == 9
# @test s.n == s2.n
# @test s.std == s2.std
# @test s.tvalue == s2.tvalue

