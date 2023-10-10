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
    @test rse_std(2:10) == s.std
    @test rse_tstat(2:10) == s.tvalue
    @test s.std ≈ 2.7386127875258306 atol = 0.00001
    @test s.tvalue ≈ 6.572670690061993 atol = 0.00001
end