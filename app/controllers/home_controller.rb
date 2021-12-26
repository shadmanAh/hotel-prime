class HomeController < ApplicationController
  def index
    @rooms = Room.all.limit(3)
  end

  def activity
    @activities = PublicActivity::Activity.all
  end
end
