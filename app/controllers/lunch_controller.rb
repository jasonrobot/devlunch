class LunchController < ApplicationController
  def view
  end

  def signup
    @dev = Dev.new(params[:dev])
  end

end
