require 'rails_helper'

RSpec.describe Vehicle, type: :model do
  describe 'on Create' do
    describe 'with valid attributes' do
      let(:valid_attributes) { attributes_for(:vehicle) }
      it 'creates the vehicle' do
        expect do
          create(:vehicle, valid_attributes)
        end.to change(Vehicle, :count).by(1)
        
      end
    end

    describe 'is invalid' do
      let(:invalid_attributes) { attributes_for(:vehicle, model: nil) }

      context 'when model' do
        it 'is null' do
          vehicle = build(:vehicle, model: nil)

          expect(vehicle).to be_invalid
        end

        it 'is empty' do
          vehicle = build(:vehicle, model: "")

          expect(vehicle).to be_invalid
        end
      end

      context 'when brand' do
        it 'is null' do
          vehicle = build(:vehicle, brand: nil)

          expect(vehicle).to be_invalid
        end

        it 'is empty' do
          vehicle = build(:vehicle, brand: "")

          expect(vehicle).to be_invalid
        end
      end

      context 'when licence plate' do
        it 'is null' do
          vehicle = build(:vehicle, licence_plate: nil)

          expect(vehicle).to be_invalid
        end

        it 'is empty' do
          vehicle = build(:vehicle, licence_plate: "")

          expect(vehicle).to be_invalid
        end
      end

      context 'when model year' do
        it 'is null' do
          vehicle = build(:vehicle, model_year: nil)

          expect(vehicle).to be_invalid
        end
      end

      context 'when manufacture year' do
        it 'is null' do
          vehicle = build(:vehicle, manufacture_year: nil)

          expect(vehicle).to be_invalid
        end
      end
    end
  end
end
