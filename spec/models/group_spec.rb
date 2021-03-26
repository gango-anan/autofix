require 'rails_helper'
RSpec.describe Group, type: :model do
  context 'validation tests' do
    let(:group) { build(:group) }

    it 'is valid if name is present.' do
      group.name = nil
      expect(group).not_to be_valid
    end

    it 'persists if all the data is correctly provided.' do
      expect(group.save).to eql true
    end
  end
end
