class UsersController < ApplicationController
  def new
  end

  def create
    puts params
    # try to match on the hipchat handle, or else the name
    if User.where(handle: params[:user][:handle]).any? then
      puts "matched the handle"
      @user = User.find_by(handle: params[:user][:handle])
      @user.update user_params
    elsif User.where(name: params[:user][:name]).any? then
      puts "matched the name"
      @user = User.find_by(name: params[:user][:name])
      @user.update user_params
    elsif @user == nil then
      puts "no matches for #{params[:user][:handle]} or #{params[:user][:name]}, new user"
      @user = User.new user_params
    end

    print "User is +1'ed?: #{params[:plusone] != nil}\n"

    # these shoud always default to false?
    @user.plus_one = false
    @user.coming = false

    if params[:plusone] != nil then
      @user.plus_one = true
    else
      @user.coming = true
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
    @winner = User.find(Winner.last.user_id)
    render 'polls_closed.html.erb'
  end

  def user_params
    return params.require(:user).permit(:name, :handle, :pick)
  end
end
