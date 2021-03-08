module EventsHelper
  def create_event(user = nil)
    if user
      link_to 'Create Events', new_event_path
    else
      link_to 'Log In to Create Events', new_session_path
    end
  end

  def current_user_name(user = nil)
    link_to @user.name, user_path(@user) if user
  end

  def heading_link(user = nil)
    link_to 'My Events', user_path(@user) if user
  end

  def show_my_event_section(events, user = nil)
    render 'event', event_type: my_event(events, user) if user
  end

  def attendee_list(attendee)
    name = []
    if attendee.size > 0
      attendee.each { |e| name << e.name }
    end
    name
  end

  private

  def my_event(events, user)
    events.select { |e| e.creator_id == user.id }
  end
end
