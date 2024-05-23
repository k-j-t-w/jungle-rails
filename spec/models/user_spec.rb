require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do

    let(:valid_user) do
      User.new(
        name: 'Kai Wingfield',
        email: 'kaiwingfield17@gmail.com',
        password: 'password123',
        password_confirmation: 'password123'
      )
    end

    it 'is valid with valid attributes' do
      expect(valid_user).to be_valid
    end

    it 'is invalid if passwords dont match' do
      user = valid_user
      user.password_confirmation = 'password12'
      expect(user).to be_invalid
    end

    it 'is invalid if email is not unique' do
      user = valid_user
      user.email = 'kai@gmail.com'
      expect(user).to be_invalid
    end

    it 'is invalid if user doesnt include email' do
      user = valid_user
      user.email = nil
      expect(user).to be_invalid
    end

    it 'is invalid if user doesnt include first name' do
      user = valid_user
      user.name = nil
      expect(user).to be_invalid
    end

    it 'is invalid if user doesnt include last name' do
      user = valid_user
      user.name = 'Kai' # Assuming the name includes both first and last names
      expect(user).to be_invalid
    end

    it 'is invalid if password doesnt meet required length' do
      user = valid_user
      user.password = 'pass' # Assuming the required length is longer than 4 characters
      user.password_confirmation = 'pass'
      expect(user).to be_invalid
    end
  end
end