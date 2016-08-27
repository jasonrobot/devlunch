class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def lunch
    polls_open
  end

  def polls_open
    render 'polls_open.html.erb'
  end

  def polls_closed
    render 'polls_closed.html.erb'
  end
end
