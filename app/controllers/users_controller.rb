class UsersController < ApplicationController

  # create a new user
  # called on form submission
  # redirects to the main page
  def create
    puts params
    # try to match on the hipchat handle, or else the name
    # if User.where(handle: params[:user][:handle]).any? then
    #   @user = User.find_by(handle: params[:user][:handle])
    #   @user.update user_params
    if User.where(name: params[:user][:name]).any? then
      @user = User.find_by(name: params[:user][:name])
      @user.update user_params
    elsif @user == nil then
      @user = User.new user_params
    end

    # these shoud always default to false?
    @user.plus_one = false
    @user.coming = true

    if params[:plusone] != nil then
      @user.plus_one = true
    end

    if @user.save then
      redirect_to action: "lunch"
    else
      lunch
    end
  end

  # action to make the pick and shift the controller to 'polls_closed' mode
  def _pick
    @winner = Winner.new
    id = User.where(plus_one: true).sample.id
    @winner.user_id = id
    @winner.save
    Pick.first.update done: true
  end

  def pick
    _pick
    redirect_to action: "lunch"
  end

  # action to reset the controller back to 'polls_open' mode
  def _reset
    User.update_all "coming = 'false', plus_one = 'false'"
    Pick.first.update done: false
  end

  def reset
    _reset
    redirect_to action: "lunch"
  end

  # load whichever view is appropriate
  def lunch
    puts 'entered lunch'
    # switch based on whether polls are open or closed
    puts "Have we picked?"
    if Pick.any? == false then
      @picked = Pick.new
      @picked.done = false
      @picked.save
    end

    if Pick.first.done == true then
      polls_closed
    else
      if @user == nil || @user.errors.empty? then
        puts 'making a new user'
        @user = User.new
      end
      polls_open
    end
  end

private

  def polls_open
    @plusoned = User.where(plus_one: true, coming: true)
    @coming = User.where(plus_one: false, coming: true)
    render 'polls_open.html.erb'
  end

  def polls_closed
    @coming = User.where(coming: true)
    @winner = User.find(Winner.last.user_id)
    render 'polls_closed.html.erb'
  end

  def user_params
    return params.require(:user).permit(:name, :handle, :pick)
  end
end
