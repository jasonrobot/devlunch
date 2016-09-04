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

  #TODO test that pick doesnt alter things once its already been called

  #TODO test that only one entry in the picks table ever exists

  #TODO test that only people who are plusoned get to pick

  #TODO test that nothing happens if no one is plusoned when pick is called

  #TODO test that users are updated correctly

end
