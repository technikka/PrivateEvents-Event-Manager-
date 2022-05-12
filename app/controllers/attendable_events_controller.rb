class AttendableEventsController < ApplicationController
  before_action :authenticate_user!

  def create
    @event = Event.find(params[:id])
    if attendable_event_params[:attend] == '1'
      @ae = AttendableEvent.new
      @ae.attendee = current_user
      @ae.attended_event = @event
      if @ae.save
        redirect_to event_path(@event.id), notice: 'You have successfully registered for this event'
      else
        redirect_to event_path(@event.id), notice: @ae.errors.full_messages.to_sentence, status: :unprocessable_entity
      end
    elsif attendable_event_params[:unattend] == '1'
      redirect_to action: :destroy
    else
      redirect_to event_path(@event.id)
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.attendees.delete(current_user)
    redirect_to event_path(@event.id), notice: 'You have successfully unregistered for this event'
  end

  private

  def attendable_event_params
    params.permit(:attend, :id, :unattend)
  end
end
