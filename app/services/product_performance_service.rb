class ProductPerformanceService < BaseService
  API_ENPOINT = 'https://makuna-predictor.herokuapp.com/makuna/performance'

  def initialize(product_name, department, year)
    @product_name = product_name
    @department = department
    @year = year
  end

  def performance

    params_hash ={}
    #params_hash[:id] = 0
    params_hash[:product_name] = @product_name
    params_hash[:department] = @department
    params_hash[:year] = @year
    #params_hash[:product_id] = 0
    params_hash[:production] = nil
    params_hash[:performance] = nil

    @result = HTTParty.post(API_ENPOINT,
      :headers => {'Content-Type'=>'application/json'},
      :body => params_hash.to_json,
    )
  end
end
