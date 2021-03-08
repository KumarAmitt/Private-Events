require 'rails_helper'

RSpec.describe EventAttendee, type: :model do

  describe 'association' do
    it { is_expected.to belong_to(:attendee).class_name('User') }

    it { is_expected.to belong_to(:attended_event).class_name('Event') }
  end

end