class Weather
  attr_reader :address, :no_of_days
  def initialize(params)
    @no_of_days = filter_no_of_days(params[:no])
    @address = params[:address]
  end

  def info
    if address.present? 
      return wres
    end
    return nil
  end

  def header
    if address.present? 
      return JSON.parse(call)["daily"]
    end
    return nil
  end

  def wres
    forecast = JSON.parse(call)["daily"]["data"].first(no_of_days)
  end

  def call
    res = RestClient::Request.execute(
      method: :get,
      url: url
      )
  end

  def url
    "https://api.darksky.net/forecast/#{configuration_api}/#{coordinates.first},#{coordinates.last}"
  end

  def configuration_api
    "ad00fe11bf1efa03949fea19000ec54d"
  end

  def location
    Geocoder.coordinates(address)
  end

  def coordinates
    [location.first, location.last]
  end

  def filter_no_of_days(no_of_days)
    no_of_days.to_i.zero? ? default_days : no_of_days.to_i
  end

  def default_days
    7
  end
end
