class AttendableEventsController < ApplicationController
  before_action :authenticate_user!

  def new
    @attendable_event = AttendableEvent.new
  end

  def create
    if attendable_event_params[:attend] == '1'
      @ae = AttendableEvent.new
      @ae.attendee = current_user
      @event = Event.find(params[:id])
      @ae.attended_event = @event
      if @ae.save
        redirect_to event_path(@event.id), notice: 'You have successfully registered for this event'
      else
        redirect_to event_path(@event.id), notice: @ae.errors.full_messages.to_sentence, status: :unprocessable_entity
      end
    else
      redirect_to event_path(@event.id)
    end
  end

  private

  def attendable_event_params
    params.permit(:attend, :id)
  end
end
