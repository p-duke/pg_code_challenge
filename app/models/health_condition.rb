class HealthCondition
  include ActiveModel::Model

  CONDITIONS = {"Allergies" => 0.01,
                "Sleep Apnea" => 0.06,
                "Heart Disease" => 0.17,
                "High Cholesterol" => 0.08,
                "Asthma" => 0.04 }
  
  attr_accessor :name, :cost_increase

  validates :name, presence: true

  def initialize(params = {})
    @name = params[:name]
    @cost_increase = CONDITIONS[params[:name]]
  end

end
