class Test < ActiveRecord::Base
  has_many :test_runs, inverse_of: :test
  belongs_to :problem, inverse_of: :tests
end
