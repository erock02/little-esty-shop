class NagerService < BaseService

  def self.get_holidays_data
    response = conn('https://date.nager.at').get('/api/v3/NextPublicHolidays/US')
    get_json(response)
  end

end
