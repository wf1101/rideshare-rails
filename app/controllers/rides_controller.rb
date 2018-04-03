class RidesController < ApplicationController
  def index
    @drivers = Driver.all
    # @passengers =
  end
end
