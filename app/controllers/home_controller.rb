class HomeController < ApplicationController
  def index
    # @dev = Params[:dev]
    @time = Time.current
  end
end
