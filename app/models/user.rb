class User < ApplicationRecord
  authenticates_with_sorcery!
  with_options presence: true do
    validates :last_name
    validates :first_name
  end
end
