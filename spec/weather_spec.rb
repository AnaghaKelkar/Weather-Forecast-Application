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
    context 'when valid parameters' do
      context 'with valid parameters for NY' do
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

        it 'returns correct number of entries' do
          expect(weather.wres.count).to eq(2);
        end

        it 'return correct url' do
          expect(weather.url).to eq("https://api.darksky.net/forecast/ad00fe11bf1efa03949fea19000ec54d/40.7127753,-74.0059728");
        end
      end

      context 'with valid parameters for Dallas' do
        let(:row) do
        {
          :address => 'Dallas',
          :no => 3
        }
        end

        let(:weather) { Weather.new(row) }

        it 'returns correct configuration api' do 
          expect(weather.configuration_api).to eq("ad00fe11bf1efa03949fea19000ec54d");
        end

        it 'return correct latitude and longitude coordinates' do
        expect(weather.location.first).to eq(32.7766642);
          expect(weather.location.last).to eq(-96.79698789999999);
        end

        it 'returns correct number of entries' do
          expect(weather.wres.count).to eq(3);
        end

        it 'return correct url' do
          expect(weather.url).to eq("https://api.darksky.net/forecast/ad00fe11bf1efa03949fea19000ec54d/32.7766642,-96.79698789999999");
        end
      end
    end

    context 'when invalid parameters' do
      context 'with invalid address' do
        let(:invalid_row) do
          {
            :no => 2
          }
        end
        let(:invalid_weather) { Weather.new(invalid_row) }    

        it 'returns nil if address not present' do
          expect(invalid_weather.address).to eq(nil);
        end
      end

      context 'with invalid number of days' do
        let(:invalid_row1) do
          {
            :no => 0
          }
        end
        let(:invalid_weather1) { Weather.new(invalid_row1) }    

        it 'checks if number of days is not selected' do
          expect(invalid_weather1.no_of_days.to_i.zero?).to be_truthy
        end
      end
    end
  end
end
