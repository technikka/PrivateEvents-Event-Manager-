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
      redirect_to @event, notice: 'Event was successfully created'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])

    if @event.update(event_params)
      redirect_to @event
    else
      render :edit, status: :unprocessably_entity
    end
  end

  def destroy
    Event.find(params[:id]).destroy
    # adding status 303 here fixed an issue where a delete method was being called on the User instead of redirecting. 
    redirect_to user_path(current_user.id), status: 303
  end

  private

  def event_params
    params.require(:event).permit(:title, :location, :date, :notes)
  end
end
