module MyStatsPackage
    using ProgressMeter
    include("statistic_functions.jl")

    export rse_sum, rse_mean, rse_std, rse_tstat
    export StatResult
    export printOwner
end