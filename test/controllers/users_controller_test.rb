require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  #TODO test that reset clears the coming and plus_one of all users
  test  "reset clears coming and plus_one" do
    user = User.new(name: 'both', coming: true, plus_one: true)
    user.save
    user = User.new(name: 'plus_one', coming: false, plus_one: true)
    user.save
    user = User.new(name: 'coming', coming: true, plus_one: false)
    user.save
    user = User.new(name: 'nothing', coming: false, plus_one: false)
    user.save

    get '/reset'
    assert User.where(coming: true).count == 0
    assert User.where(plus_one: true).count == 0
  end

  # Waiting
  
  test "can't change voting or joining" do
    #create a user
    #set state waiting
    #change to voting
    #assert it doesnt work
    #change to joining
    #assert it doesnt work
  end

  # Voting

  # Results

  test "cant remove voting status" do
    #set state voting
    #create a user
    #change user voting
    #set state results
    #change user joining
    #assert user voting
    #change user not voting
    #assert user voting
  end

  test "winner can change pick" do
    #set state voting
    #create user, set pick
    #change user to winner
    #set state results
    #change pick
    #assert new pick
  end

  test "if not voting, can change joining status" do
    #create user
    #set state results
    #change user joining
    #assert user joining
    #change user not joining
    #assert user not joining
  end

end
