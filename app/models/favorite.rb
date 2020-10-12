class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :reptile

  validates_uniqueness_of :reptile_id, scope: :user_id
end
