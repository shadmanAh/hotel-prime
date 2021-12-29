class HomeController < ApplicationController
  skip_before_action :authenticate_user!, :only => [:index]
  def index
    @rooms = Room.all.limit(3)
    @main = Main.find(1)
  end

  def activity
    @activities = PublicActivity::Activity.all
  end
end
