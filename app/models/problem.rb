class Problem < ActiveRecord::Base
  has_many :solutions, inverse_of: :problem, dependent: :destroy
  has_many :tests, inverse_of: :problem, dependent: :destroy

  def participants
    self.solutions.select(:user_id).uniq
  end
end
