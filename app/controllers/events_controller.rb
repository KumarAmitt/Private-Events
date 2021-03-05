class EventsController < ApplicationController
  include EventsHelper

  def index
    @events = Event.all
    @user = current_user
    @upcoming = Event.upcoming
    @past = Event.past
  end

  def new
    @event = Event.new
  end

  def show
    @event = Event.find(params[:id])
  end

  def edit; end

  def create
    @user = current_user
    @event = current_user.events.build(event_params)

    if @event.save
      flash[:notice] = 'New event created'
      redirect_to @events
    else
      flash.now[:notice] = 'Something went wrong'
      render :new
    end
  end

  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end



  private

  def event_params
    params.require(:event).permit(:name, :description, :event_date)
  end
end
