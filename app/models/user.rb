class User < ActiveRecord::Base
  has_many :solutions, inverse_of: :user, dependent: :destroy

  def score
    self.solutions.select(:problem_id).uniq.count * 5 + self.solutions.count
  end
end
