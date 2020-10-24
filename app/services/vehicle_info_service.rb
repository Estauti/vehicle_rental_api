class VehicleInfoService
  def self.getBrands
    response = Typhoeus.get("#{FIPE_URL}/marcas.json")

    if response.success?
      data = JSON.parse(response.body)
      data = data.map { |b| { id: b["id"], name: b["fipe_name"] } }
  
      return data

    elsif response.timed_out?
      raise StandardError, "Time out"
      
    else
      raise StandardError, "Something wrong happened"

    end
  end

  def self.getBrandModels(brand_id)
    raise ArgumentError, "An ID (integer) must be provided" if brand_id.nil? || !brand_id.is_a?(Integer)

    response = Typhoeus.get("#{FIPE_URL}/veiculos/#{brand_id}.json")

    if response.success?
      data = JSON.parse(response.body)
      data = data.map { |b| { id: b["id"].to_i, name: b["name"] } }
  
      return data

    elsif response.timed_out?
      raise StandardError, "Time out"

    elsif response.code == 404
      raise StandardError, "Brand not found"
      
    else
      raise StandardError, "Something wrong happened"

    end
  end

  private

    FIPE_URL = "http://fipeapi.appspot.com/api/1/carros".freeze
end