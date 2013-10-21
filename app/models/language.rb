class Language < ActiveRecord::Base
  has_many :solutions, inverse_of: :language
end
