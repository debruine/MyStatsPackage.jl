module MyStatsPackage

using ProgressMeter
include("src/stats_functions.jl")

export rse_sum, rse_mean, rse_std, rse_tstat
export StatResult

end