module WeatherHelper
  def type_options
    ["Select number of days for Weather Forecast", "1", "2", "3", "4", "5", "6","7"]
  end

  def pretty_date(t)
    d = Time.at(t).to_date
    "#{d.day} #{month(d.month)} #{d.year}"
  end

  def month(n)
  	return months[n]
  end

  def months
  	[nil, 'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
  end
end
