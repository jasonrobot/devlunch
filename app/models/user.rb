class User < ApplicationRecord
  validates :name, presence: true
  validates :pick, presence: true, if: :voting?

  after_initialize do |user|
    if (user.nickname == "" )
      user.nickname = user.name
    end
  end

  def voting=(val)
    write_attribute :voting, val
    write_attribute :joining, !val
  end

  def joining=(val)
    write_attribute :joining, val
    write_attribute :voting, !val
  end

end
