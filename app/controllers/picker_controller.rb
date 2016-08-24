class PickerController < ApplicationController
  def index
  end

  def addPlusOne
    @plusone = Plusone.new
end
