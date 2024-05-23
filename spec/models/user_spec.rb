require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do

    let(:valid_user) do
      User.new(
        first_name: 'Kai Wingfield',
        last_name: 'Kai Wingfield',
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
      valid_user.save
      invalid_user = User.new(
        first_name: 'Another',
        last_name: 'User',
        email: 'kaiwingfield17@gmail.com',
        password: 'password123',
        password_confirmation: 'password123'
      )
      expect(invalid_user).to be_invalid
    end

    it 'is invalid if user doesnt include email' do
      user = valid_user
      user.email = nil
      expect(user).to be_invalid
    end

    it 'is invalid if user doesnt include first name' do
      user = valid_user
      user.first_name = nil
      expect(user).to be_invalid
    end

    it 'is invalid if user doesnt include last name' do
      user = valid_user
      user.last_name = nil
      expect(user).to be_invalid
    end

    it 'is invalid if password doesnt meet required length' do
      user = valid_user
      user.password = 'pass' 
      user.password_confirmation = 'pass'
      expect(user).to be_invalid
    end
  end
end
  
  describe 'Class Methods' do
    describe '.authenticate_with_credentials' do
      let!(:user) do
        User.create(
          first_name: 'Test',
          last_name: 'User',
          email: 'test@example.com',
          password: 'password123',
          password_confirmation: 'password123'
        )
      end

      it 'returns the user if authenticated' do
        authenticated_user = User.authenticate_with_credentials('test@example.com', 'password123')
        expect(authenticated_user).to eq(user)
      end

      it 'returns nil if not authenticated' do
        authenticated_user = User.authenticate_with_credentials('test@example.com', 'wrong_password')
        expect(authenticated_user).to be_nil
      end

      it 'strips leading/trailing whitespaces in email' do
        authenticated_user = User.authenticate_with_credentials('  test@example.com  ', 'password123')
        expect(authenticated_user).to eq(user)
      end

      it 'ignores case when matching email' do
        authenticated_user = User.authenticate_with_credentials('tEst@Example.com', 'password123')
        expect(authenticated_user).to eq(user)
      end
    end
end