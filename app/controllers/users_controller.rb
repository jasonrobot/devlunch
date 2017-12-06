class UsersController < ApplicationController

  ## Create
  
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

  ## Read
  def read
    puts "in read"
    puts params
  end

  ## Update

  def update
    puts "in update"
    puts params
  end

  ## Delete



end
