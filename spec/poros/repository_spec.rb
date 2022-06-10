require 'rails_helper'

RSpec.describe Holiday do
  it "exists and has attributes" do
    data = { localname: 'Fake Holiday' }
    holiday = Holiday.new(data)

    expect(holiday).to be_an_instance_of(Holiday)
  end

  it "can get holidays" do
    data = [{"localName":"Juneteenth"},{"localName":"Independence Day"}]
    holiday = Holiday.new(data)

    expect(holiday.get_holidays).to eq(["Juneteenth","Independence Day"])
  end
end
