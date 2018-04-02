class RidesController < ApplicationController
  def index
  @drivers = Driver.all
  end
end
