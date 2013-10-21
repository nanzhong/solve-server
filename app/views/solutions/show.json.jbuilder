json.set! :code, @solution.code

json.tests do
  json.array! @solution.problem.tests, :id, :input, :output
end

json.set! :command, @solution.language.command
