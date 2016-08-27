class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def lunch
    polls_open
  end

  def polls_open
  end

  def polls_closed
  end
end
