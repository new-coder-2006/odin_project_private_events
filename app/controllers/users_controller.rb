class UsersController < ApplicationController
    before_action :authenticate_user!

    def show
        @user_events = current_user.hosted_events
        @events_attending = current_user.attended_events
    end
end
