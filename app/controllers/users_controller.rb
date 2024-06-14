class UsersController < ApplicationController
    before_action :authenticate_user!

    def show
        @user_events = current_user.hosted_events
        @current_date = Date.today
        @future_events = current_user.attended_events.where('event_date >= ?', @current_date)
        @past_events = current_user.attended_events.where('event_date < ?', @current_date)
        @undated_events = current_user.attended_events.where(event_date: nil)
    end
end
