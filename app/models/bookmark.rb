class Bookmark < ApplicationRecord
  belongs_to :user
  belongs_to :board

  validates :user_id, uniqueness: { scope: :board_id } # user_id と board_idの組み合わせを一意性のあるものにしている
end
