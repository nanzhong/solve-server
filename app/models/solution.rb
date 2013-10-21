class Solution < ActiveRecord::Base
  has_many :test_runs, inverse_of: :solution, dependent: :destroy
  belongs_to :user, inverse_of: :solutions
  belongs_to :problem, inverse_of: :solutions
  belongs_to :language, inverse_of: :solutions

  def correct
    self.test_runs.each do |test_run|
      return false unless test_run.success
    end
  end
end
