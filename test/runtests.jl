using MyStatsPackage, Test

@testset "basic functions" begin
    @test rse_sum(1:36) == 666
    @test rse_mean(-15:17) == 1
    @test rse_std(1:3) == 1
    @test rse_tstat(2:3) == 5
end

@testset "StatResult" begin
    s = StatResult(2:10)
    @test s.x == 2:10
    @test s.n == 9
    @test length(s) == 9
end