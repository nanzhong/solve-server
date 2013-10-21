class TestRun < ActiveRecord::Base
  belongs_to :solution, inverse_of: :test_runs
  belongs_to :test, inverse_of: :test_runs
end
