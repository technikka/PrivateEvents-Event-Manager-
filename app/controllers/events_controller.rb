class EventsController < ApplicationController
  def index
    @events = Event.all.order(:date)
  end

  def new
    @event = current_user.events.build
  end

  def create
    @event = current_user.events.build(event_params)

    if @event.save
      redirect_to event_path(@event.id), notice: 'Event was successfully created'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  private

  def event_params
    params.require(:event).permit(:title, :location, :date)
  end
end
