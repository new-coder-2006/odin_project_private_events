class EventsController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create]

    def new
        @event = Event.new
    end

    def create
        @event = current_user.hosted_events.build(event_params)
    
        if @event.save
          redirect_to events_path
        else
          puts event_params
          render :new, status: :unprocessable_entity
        end
    end

    def show
        @event = Event.find(params[:id])
    end

    def index
        @events = Event.all
    end
    
    def rsvp
        @event = Event.find(params[:id])
        
        if current_user.attended_events << @event
            flash[:notice] = "You have successfully RSVPed to the event."
        else
            flash[:alert] = "There was an error RSVPing to the event."
        end
        
        redirect_to events_path
    end

    private

    def event_params
        params.require(:event).permit(:event_name, :location, :event_date, :details)
    end
end
