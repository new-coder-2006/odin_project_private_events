class UsersController < ApplicationController
    before_action :authenticate_user!

    def show
        @user_events = current_user.hosted_events
    end
end
