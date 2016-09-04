require 'test_helper'

class WinnerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "winner has to be plusoned" do
    @user = User.new
    @user.name = "test user"
    @user.plus_one = false
    
  end
end
