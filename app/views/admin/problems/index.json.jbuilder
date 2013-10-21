json.array!(@problems) do |problem|
  json.extract! problem, :name, :description
  json.url problem_url(problem, format: :json)
end
