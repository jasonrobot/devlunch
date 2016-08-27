class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.new(params[:user])
    # if params['name'] == 'plusone' do
    #
    # else
    #
    # end
  end

  def lunch
    @user = User.new
    polls_open
  end

private

  def polls_open
    render 'polls_open.html.erb'
  end

  def polls_closed
    render 'polls_closed.html.erb'
  end
end
