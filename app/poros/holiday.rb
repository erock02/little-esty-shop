class Holiday

  def initialize(data)
    @data = data
  end

  def get_holidays
    @holidays_array = Array.new(0)
    @data.each do |holiday|
      @holidays_array << holiday[:localName]
    end
    @holidays_array
  end
end
