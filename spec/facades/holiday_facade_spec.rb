require 'rails_helper'

RSpec.describe HolidayFacade do
  describe 'create repository poros' do
    it "creates objects from the repository", :vcr do
      holiday = HolidayFacade.create_holidays

      expect(holiday).to be_an_instance_of(Holiday)
    end
  end

end
