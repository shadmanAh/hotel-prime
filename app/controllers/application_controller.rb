class ApplicationController < ActionController::Base
    before_action :authenticate_user!

    include PublicActivity::StoreController

    before_action :set_global_variables, if: :user_signed_in?
    def set_global_variables
        @ransack_rooms = Room.ransack(params[:rooms_search], search_key: :rooms_search)
    end
end
