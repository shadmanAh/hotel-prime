class HomeController < ApplicationController
  def index
    @rooms = Room.all.limit(3)
  end
end
