class User < ApplicationRecord
  validates :name, presence: true
  validates :pick, presence: true, if: :user_plusoned?

  def user_plusoned?
    plus_one == true
  end
end
