class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.new user_params
    print "User is +1'ed?: #{params[:plusone] != nil}\n"

    if params[:plusone] != nil then
      @user.plus_one = true
    else
      @user.plus_one = false
    end

    if @user.save then
      redirect_to action: "lunch"
    else
      lunch
    end
  end

  def lunch
    puts 'entered lunch'
    puts @user == nil

    if @user == nil || @user.errors.empty? then
      puts 'making a new user'
      @user = User.new
    end
    # switch based on whether polls are open or closed

    polls_open
    # polls_closed
  end

private

  def polls_open
    @plusoned = User.where(plus_one: true)
    @coming = User.where(plus_one: false)
    render 'polls_open.html.erb'
  end

  def polls_closed
    @coming = User.all
    @winner = User.first
    render 'polls_closed.html.erb'
  end

  def user_params
    return params.require(:user).permit(:name, :handle, :pick)
  end
end
