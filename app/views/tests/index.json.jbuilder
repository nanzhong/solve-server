json.array!(@tests) do |test|
  json.extract! test, :problem_id, :name, :input, :output
  json.url test_url(test, format: :json)
end
