require 'rails_helper'

RSpec.describe Expenditure, type: :model do
  context 'validation tests' do
    let(:exp) { build(:expenditure) }
    it 'is valid if expenditure name is present.' do
      exp.name = nil
      expect(exp).not_to be_valid
    end

    it 'is valid if the author is present.' do
      exp.author_id = nil
      expect(exp).not_to be_valid
    end

    it 'is valid if the amount is present.' do
      exp.amount = nil
      expect(exp).not_to be_valid
    end

    it 'persists if all the data is correctly provided.' do
      expect(exp.save).to eql true
    end
  end
end
