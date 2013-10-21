class TestWorker
  include Sidekiq::Worker

  def perform(solution_id)
    @solution = Solution.find(solution_id)
    `docker run -u tunner solve/runner ruby /home/runner/runner.rb #{@solution.problem.id} #{@solution.id}`
    #`ruby /Users/nan/src/solve/runner/runner.rb #{@solution.problem.id} #{@solution.id}`
  end
end
