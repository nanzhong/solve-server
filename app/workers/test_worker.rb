class TestWorker
  include Sidekiq::Worker

  def perform(solution_id)
    @solution = Solution.find(solution_id)
    puts `echo solveme | sudo -S docker run -u runner solve/runner ruby /home/runner/runner.rb #{@solution.problem.id} #{@solution.id}`
    #`ruby /Users/nan/src/solve/runner/runner.rb #{@solution.problem.id} #{@solution.id}`
  end
end
