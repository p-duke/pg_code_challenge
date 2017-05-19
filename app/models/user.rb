class User
  include ActiveModel::Model

  attr_accessor :name, :age, :gender, :location, :health_conditions

  validates :name, :age, :gender, :location, presence: true
  validates :age, numericality: { only_integer: true }
  validates :gender, inclusion: { in: %w(male female) }

  def initialize(params = {})
    @name = params[:name]
    @age = params[:age]
    @gender = params[:gender]
    @location = params[:location]
    @health_conditions = params[:health_conditions]
  end

end
