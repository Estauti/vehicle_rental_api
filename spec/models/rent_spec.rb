require 'rails_helper'

RSpec.describe Rent, type: :model do
  describe 'on create' do
    describe 'with valid attributes' do
      let(:valid_attributes) { attributes_for(:rent, vehicle_id: create(:vehicle).id) }

      it 'creates a rent' do
        expect do
          create(:rent)
        end.to change(Rent, :count).by(1)
      end
    end

    describe 'is invalid' do
      context 'when vehicle' do
        it 'is null' do
          rent = build(:rent, vehicle: nil)

          expect(rent).to be_invalid
        end

        it 'is already in use' do
          first_start_date = Date.today()
          old_rent = create(
            :rent, 
            start_date: first_start_date, 
            end_date: first_start_date + 1.week
          )

          rent = build(
            :rent, 
            vehicle: old_rent.vehicle, 
            start_date: old_rent.end_date - 1.days, 
            end_date: old_rent.end_date + 2.days
          )

          expect(rent).to be_invalid
        end
      end

      context 'when cpf' do
        it 'is null' do
          rent = build(:rent, cpf: nil)

          expect(rent).to be_invalid
        end

        it 'is empty' do
          rent = build(:rent, cpf: '')

          expect(rent).to be_invalid
        end

        it 'has wrong format' do
          rent = build(:rent, cpf: '123')

          expect(rent).to be_invalid
        end
      end

      context 'when start date' do
        it 'is null' do
          rent = build(:rent, start_date: nil)

          expect(rent).to be_invalid
        end

        it 'is before today' do
          rent = build(:rent, start_date: Date.today() - 1.day)

          expect(rent).to be_invalid
        end
      end

      context 'when end date' do
        it 'is null' do
          rent = build(:rent, end_date: nil)

          expect(rent).to be_invalid
        end

        it 'is before start date' do
          rent = build(:rent, start_date: Date.today(), end_date: Date.today() - 1.day)

          expect(rent).to be_invalid
        end
      end
    end
  end
end
