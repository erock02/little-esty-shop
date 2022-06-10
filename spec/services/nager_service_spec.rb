require 'rails_helper'

RSpec.describe NagerService do
  describe "API holiday endpoint" do
    it 'gets holiday data from Nager endpoint', :vcr do
      json = NagerService.get_holidays_data
      expect(json[0]).to have_key(:localName)
    end
  end
end
