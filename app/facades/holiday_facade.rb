class HolidayFacade

  def self.create_holidays_or_error
    json = NagerService.get_holidays_data
  end

  def self.create_holidays
    json = NagerService.get_holidays_data
    Holiday.new(json)
  end

end
