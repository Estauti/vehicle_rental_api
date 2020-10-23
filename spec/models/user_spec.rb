require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'on create' do
    describe 'with valid attributes' do
      let(:valid_attributes) { attributes_for(:user) }

      it 'creates a user' do
        expect do
          create(:user, valid_attributes)
        end.to change(User, :count).by(1)
      end
    end

    describe 'is invalid' do
      context 'when name' do
        it 'is null' do
          user = build(:user, name: nil)

          expect(user).to be_invalid
        end

        it 'is empty' do
          user = build(:user, name: '')

          expect(user).to be_invalid
        end
      end

      context 'when email' do
        it 'is null' do
          user = build(:user, email: nil)

          expect(user).to be_invalid
        end

        it 'is empty' do
          user = build(:user, email: '')

          expect(user).to be_invalid
        end

        it 'has invalid format' do
          user = build(:user, email: FFaker::Lorem.word)

          expect(user).to be_invalid
        end

        it 'is already in use' do
          old_user = create(:user)
          user = build(:user, email: old_user.email)

          expect(user).to be_invalid
        end
      end

      context 'when password' do
        it 'is null' do
          user = build(:user, password: nil)

          expect(user).to be_invalid
        end

        it 'is empty' do
          user = build(:user, password: '')

          expect(user).to be_invalid
        end
      end

      context 'when password confirmation' do
        it 'is null' do
          user = build(:user, password_confirmation: nil)

          expect(user).to be_invalid
        end

        it 'is empty' do
          user = build(:user, password_confirmation: '')

          expect(user).to be_invalid
        end

        it 'is differs from password' do
          user = build(:user, password_confirmation: FFaker::Internet.password)

          expect(user).to be_invalid
        end
      end
    end
  end
end
