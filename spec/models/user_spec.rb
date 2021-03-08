require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it { should have_many(:events) }
    it { should have_many(:event_attendees) }
    it { should have_many(:attended_events).through(:event_attendees).source(:attended_event) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name)}
  end
end

