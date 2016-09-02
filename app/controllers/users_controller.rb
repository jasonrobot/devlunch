class UsersController < ApplicationController

  # create a new user
  # called on form submission
  # redirects to the main page
  def create
    puts params
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

  # action to make the pick and shift the controller to 'polls_closed' mode
  def pick
    @winner = Winner.new
    id = User.where(plus_one: true).sample.id
    @winner.user_id = id
    @winner.save
    Pick.first.update done: true
  end

  # action to reset the controller back to 'polls_open' mode
  def reset
    #set plus_one to false
    #set coming to false
    User.where(coming: true) do | user |
      user.plus_one = false
      user.coming = false
      user.save
    end
    #set Picked.done to false
    Pick.first.update done: false
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

    #if the date is 12:00 on friday, we should pick
    # time = Time.new
    # if time.wday == 5 && time.hour >= 12 && Pick.first.done == false then
    #   pick
    # end
    #if its after 

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
