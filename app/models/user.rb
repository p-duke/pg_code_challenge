class User
  include ActiveModel::Model

  EAST_COST_LOCATIONS = [ 'Boston', 'New York' ].freeze

  attr_accessor :first_name, :age, :gender, :location, :health_conditions

  validates :first_name, :age, :gender, :location, presence: true
  validates :age, numericality: { only_integer: true }
  validates :gender, inclusion: { in: %w(male female) }

  def initialize(params = {})
    @first_name = params["first_name"]
    @age = params["age"]
    @gender = params["gender"]
    @location = params["location"]
    @health_conditions = instantiate_health_conditions(params["health_conditions"])
  end

  def over_18?
    self.age > 18
  end

  def number_of_years_over_18
    self.age - 18
  end

  def east_coast_location?
    EAST_COST_LOCATIONS.any? {|city| format_location(city) == format_location(self.location) }
  end

  def is_female?
    self.gender == 'female'
  end

  private

  def format_location(location)
    location.gsub(/\s+/,"").downcase
  end

  def instantiate_health_conditions(health_conditions)
    hc_list = []

    health_conditions.each do |health_condition|
      hc_list << HealthCondition.new(name: health_condition)
    end

    hc_list
  end

end
