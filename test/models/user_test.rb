require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "coming defaults to true" do
    user = User.new name: 'test'
    user.save
    assert user.coming
  end

  test "plus_one defaults to false" do
    user = User.new name: 'test'
    user.save
    assert user.plus_one == false
  end
end
