require 'rails_helper'

RSpec.describe Event, type: :model do

  describe 'association' do
    it { is_expected.to belong_to(:creator).class_name('User') }

    it { is_expected.to have_many(:event_attendees).with_foreign_key(:attended_event_id) }

    it { is_expected.to have_many(:attendees).source(:attendee) }
  end

   describe 'validation' do
   it { is_expected.to validate_presence_of(:name) }

    it { is_expected.to validate_presence_of(:event_date) }
   end
end
