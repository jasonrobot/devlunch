class User < ApplicationRecord
  validates :handle, presence: true
  validates :pick, presence: true, if: :user_plusoned?

  def user_plusoned?
    plus_one == true
  end
end
