require "rails_helper"

# feature "user visits homepage" do
#   scenario "successfully" do
#     visit root_path
#     fill_in "address", with: "NY"
#     # fill_in "no", with: "2"
#     click_button "Search"
#     # expect(page).to have_css('h1', text: "Current Weather for 51.5072, -0.1275")  
#   end
# end

module WeatherForecast
  RSpec.describe Weather do
    context 'with valid parameters' do
      let(:row) do
      {
        :address => 'NY',
        :no => 2
      }
      end

      let(:weather) { Weather.new(row) }
      
      it 'returns correct configuration api' do 
        expect(weather.configuration_api).to eq("ad00fe11bf1efa03949fea19000ec54d");
      end

      it 'return correct latitude and longitude coordinates' do
        expect(weather.location.first).to eq(40.7127753);
        expect(weather.location.last).to eq(-74.0059728);
      end

      it 'returns correct time' do

      end

      it 'return correct url' do
        expect(weather.url).to eq("https://api.darksky.net/forecast/ad00fe11bf1efa03949fea19000ec54d/40.7127753,-74.0059728");
      end

      it 'returns correct 1st day parameters' do
        expect(weather.wres.first["temperatureLow"]).to eq(42.28)
        expect(weather.wres.first["temperatureHigh"]).to eq(45.35);
        expect(weather.wres.first["humidity"]).to eq(0.92);
        expect(weather.wres.first["pressure"]).to eq(1023.32);
        expect(weather.wres.first["windSpeed"]).to eq(4.42);
      end

      it 'returns correct 2nd day parameters' do
        expect(weather.wres.last["temperatureLow"]).to eq(39.34)
        expect(weather.wres.last["temperatureHigh"]).to eq(47.67);
        expect(weather.wres.last["humidity"]).to eq(0.96);
        expect(weather.wres.last["pressure"]).to eq(1013.8);
        expect(weather.wres.last["windSpeed"]).to eq(0.38);
      end
    end

    context 'with invalid parameters' do
      let(:invalid_row) do
        {
          :no => 2
        }
      end

      let(:invalid_row1) do
        {
          :no => 0
        }
      end

      let(:invalid_weather) { Weather.new(invalid_row) }    
      let(:invalid_weather1) { Weather.new(invalid_row1) }    

      it 'returns nil if address not present' do
        expect(invalid_weather.address).to eq(nil);
      end

      it 'checks if number of days is not select' do
        expect(invalid_weather1.no_of_days.to_i.zero?).to be_truthy
      end
    end
  end
end
