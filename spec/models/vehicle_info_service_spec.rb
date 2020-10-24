# require './app/services/vehicle_info_service.rb'
# require 'vehicle_info_service.rb'

RSpec.describe VehicleInfoService do
  describe 'getBrands' do
    describe 'on success response' do
      it 'returns an array' do
        data = VehicleInfoService.getBrands

        expect(data).to be_kind_of(Array)
      end

      it 'is an array of hashes' do
        data = VehicleInfoService.getBrands

        expect(data).to be_kind_of(Array)
        expect(data[0]).to be_kind_of(Hash)
      end
    end
  end

  describe 'getBrandModels' do
    describe 'on success response' do
      it 'returns an array' do
        data = VehicleInfoService.getBrandModels(10)

        expect(data).to be_kind_of(Array)
      end

      it 'is an array of hashes' do
        data = VehicleInfoService.getBrandModels(10)

        expect(data).to be_kind_of(Array)
        expect(data[0]).to be_kind_of(Hash)
      end
    end

    describe 'on failed response' do
      it 'raises error when brand not found' do
        expect do
          VehicleInfoService.getBrandModels(0)
        end.to raise_error(StandardError)
      end
    end
  end
end
