require 'rails_helper'

RSpec.describe User, type: :model do
  context 'presence tests' do
    let(:user) { build(:user) }
    it 'ensures username presence.' do
      user.username = nil
      expect(user).not_to be_valid
    end

    it 'ensures password presence.' do
      user.password_digest = nil
      expect(user).not_to be_valid
    end

    it 'saves successfully if password is between 6 - 25 character.' do
      user.password = SecureRandom.hex(10).to_s
      user.password_confirmation = user.password
      expect(user.save).to eq true
    end
  end
  context 'validation tests' do
    let(:user) { build(:user) }
    it 'is only valid when all data is provided.' do
      expect(user).to be_valid
    end

    it 'ensures the username is not less than 4 characters.' do
      user.username = SecureRandom.hex(1).to_s
      expect(user).not_to be_valid
    end

    it 'ensures the username is not more than 20 characters' do
      user.username = SecureRandom.hex(11).to_s
      expect(user).not_to be_valid
    end

    it 'ensures the username is between 4 and 20 characters' do
      user.username = SecureRandom.hex(5).to_s
      expect(user).to be_valid
    end

    it 'ensures the password is not less than 6 character.' do
      user.password = SecureRandom.hex(1).to_s
      user.password_confirmation = user.password
      expect(user.save).to eq false
    end

    it 'ensures the password is not more than 25 character.' do
      user.password = SecureRandom.hex(13).to_s
      user.password_confirmation = user.password
      expect(user.save).to eq false
    end
  end
end
