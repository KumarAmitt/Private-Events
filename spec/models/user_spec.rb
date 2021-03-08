require 'rails_helper'

RSpec.describe User, type: :model do
  # subject(:user) { build(:user) }

  # describe 'associations' do
  #   it { is_expected.to have_many(:events) }
  #
  #   it { is_expected.to have_many(:attended_events).through(:event_attendances).source(:attended_event) }
  # end

  describe 'validations' do
    it { should validate_presence_of(:name) }

    # it { is_expected.to validate_presence_of(:name) }

    # it { is_expected.to validate_uniqueness_of(:name).case_insensitive }
  end
end

