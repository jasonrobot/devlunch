require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "name must be present" do
    user = User.new
    assert user.valid? == false
  end

  test "nickname defaults to name if empty" do
    user = User.new name: "tester"
    assert user.nickname == "tester"
  end

  test "can set all props" do
    user = User.new
    user.name = "foo"
    assert user.name == "foo"

    user.nickname = "bar"
    assert user.nickname == "bar"

    user.pick = "baz"
    assert user.pick == "baz"
  end

  test "joining and voting default to false" do
    user = User.new name: 'test'
    user.save
    assert !user.joining
    assert !user.voting
  end

  test "can't be voting and joining" do
    user = users(:tfix)
    user.joining = true
    user.voting = true
    puts user.voting
    assert !user.joining
    assert user.voting

    user.joining = true
    assert !user.voting
    assert user.joining
  end

  test "I can has fixture" do
    assert users(:tfix).name == 'Poop'
  end
end
