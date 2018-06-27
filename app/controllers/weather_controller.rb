class WeatherController < ApplicationController
  def new
  end

  def index
    @location, @num = get_params(params)
    @weather_response = weather || nil
    @weather_header = weather_header
    @url = url if @location.present?
  end

private

  def winstance
    @winstance ||= Weather.new(params)
  end

  def weather
    winstance.info
  end

  def weather_header
    winstance.header
  end

  def url
    winstance.url
  end

  def get_params(params)
    [params[:address], filter_no_of_days(params[:no])]
  end

  def filter_no_of_days(no_of_days)
    no_of_days.to_i.zero? ? default_days : no_of_days.to_i
  end

  def default_days
    7
  end
end
