json.array!(@solutions) do |solution|
  json.extract! solution, :problem_id, :user_id, :code
  json.url problem_solution_url(solution, format: :json)
end
